local service_transactions_tab = gui.get_tab(">Gsxr's Money<")

local transactions = {
"SERVICE_EARN_CASINO_AWARD_STRAIGHT_FLUSH",
"SERVICE_EARN_YOHAN_SOURCE_GOODS",
"SERVICE_EARN_BOUNTY_COLLECTED",
"SERVICE_EARN_CHALLENGE_WIN",
"SERVICE_EARN_GANGOPS_FINALE",
"SERVICE_EARN_GANGOPS_AWARD_MASTERMIND_2",
"SERVICE_EARN_GANGOPS_AWARD_MASTERMIND_3",
"SERVICE_EARN_GANGOPS_AWARD_MASTERMIND_4",
"SERVICE_EARN_GANGOPS_AWARD_LOYALTY_AWARD_2",
"SERVICE_EARN_GANGOPS_AWARD_LOYALTY_AWARD_3",
"SERVICE_EARN_GANGOPS_AWARD_LOYALTY_AWARD_4",
"SERVICE_EARN_COLLECTABLES_ACTION_FIGURES",
"SERVICE_EARN_SPIN_THE_WHEEL_CASH",
"SERVICE_EARN_TUNER_DAILY_VEHICLE",
"SERVICE_EARN_TUNER_AWARD_FLEECA_BANK"
}

local selected_transaction = 0

service_transactions_tab:add_imgui(function()
    if not network.is_session_started() or not script.is_active("shop_controller") then
        ImGui.Text("Online use only due to crashes")
        return
    end
	
    ImGui.SetNextItemWidth(500)
    selected_transaction = ImGui.Combo("Select Transaction", selected_transaction, transactions, #transactions)
    
    if ImGui.Button("Trigger Transaction") then
        script.run_in_fiber(function(script)
            if NETSHOPPING.NET_GAMESERVER_USE_SERVER_TRANSACTIONS() then
                local hash  = joaat(transactions[selected_transaction + 1])
                local price = NETSHOPPING.NET_GAMESERVER_GET_PRICE(hash, joaat("CATEGORY_SERVICE_WITH_THRESHOLD"), true)
                local index = memory.allocate(4)		
                if NETSHOPPING.NET_GAMESERVER_CATALOG_ITEM_KEY_IS_VALID(hash) then
                    scr_function.call_script_function("shop_controller", "FST", "2D 06 09 00 00 5D ? ? ? 06", "void", {
                        { "int", hash   },
                        { "int", price  },
                        { "ptr", index  },
                        { "bool", true  }, -- To Bank
                        { "bool", false }, -- To Wallet
                        { "bool", false }  -- This seems to be unused
                    })
                    memory.free(index)
                    script:sleep(500)
                    if globals.get_int(4538089) ~= 1 then
                        gui.show_message("Service Transactions", "Transaction Successful.")
                    else
                        gui.show_error("Service Transactions", "Transaction Failed.")
                        globals.set_int(4538089, 0) -- There is an unused code in the function that bails you if the transaction fails
                    end
                end
            else
                gui.show_error("Service Transactions", "Cannot trigger transaction. Are you using FSL?")
            end
        end)
    end
end)
