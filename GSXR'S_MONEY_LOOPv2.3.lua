--gsxr's money loop script
gui.show_message("GsxrLoopv2.3 LUA Undetected", "INJECTION SUCCESS;) DISCORD:notgsxr_ Reworked $ Loops And Detection In v2.3")

log.warning("This Log Is Here To Notify CREATED BY that600ccbrah On Discord Only Get $20M A Day For Ur Safety")

local TransactionManager <const> = {};
TransactionManager.__index = TransactionManager

function TransactionManager.new()
    local instance = setmetatable({}, TransactionManager);

    instance.Transactions = {
        {label = "15M (ONCE A DAY 15MIL BY GSXR)", hash = 0x176D9D54},
         }

    return instance;
end

---@return Table TransactionList
function TransactionManager:GetTransactionList()
    return self.Transactions;
end

---@return Int32 character
function TransactionManager:GetCharacter()
    local _, char = STATS.STAT_GET_INT(joaat("MPPLY_LAST_MP_CHAR"), 0, 1)
    return tonumber(char);
end

---@param Int32 hash 
---@param Int32 category
---@return Int32 price
function TransactionManager:GetPrice(hash)
    return tonumber(NETSHOPPING.NET_GAMESERVER_GET_PRICE(hash, 0x57DE404E, true))
end

 
---@param Int32 hash 
---@param? Int32 amount 
function TransactionManager:TriggerTransaction(item_hash)
	script.execute_as_script("shop_controller", function()
		if NETSHOPPING.NET_GAMESERVER_BASKET_IS_ACTIVE() then
			NETSHOPPING.NET_GAMESERVER_BASKET_END()
		end

		local status, tranny_id = NETSHOPPING.NET_GAMESERVER_BEGIN_SERVICE(-1, 0x57DE404E, item_hash, 0x562592BB, self:GetPrice(item_hash), 2)
		if status then
			NETSHOPPING.NET_GAMESERVER_CHECKOUT_START(tranny_id)
		end
	end)
end

function TransactionManager:Init()
    local tab               = gui.get_tab("GsxrLoopv2.3 Undetected")
    local sub_atm           = tab:add_tab("Detection Options")
    local sub_transaction   = tab:add_tab("Gsxr's Money Options")
    local checkboxwb        = sub_atm:add_checkbox("Detection Bypass Buggy So Be Safe")
    local checkbox180k        = sub_transaction:add_checkbox("180k SAFE Loop")
    local sameline          = sub_transaction:add_sameline()
    local checkbox100k       = sub_transaction:add_checkbox("100K SAFE Loop")
    sub_transaction:add_sameline()
    local bountyloop       = sub_transaction:add_checkbox("Bounty SAFE Loop")
    local sub_transactionL  = tab:add_tab("One Time Per Day Transaction")


    script.register_looped("180ktransaction", function()
        if checkbox1m:is_enabled() then
            self:TriggerTransaction(0x615762F1)
        end
    end)
    


    script.register_looped("100ktransaction", function(script)
        if(checkbox100k:is_enabled()) then 
            self:TriggerTransaction(0x68341DC5);
        end
    end)

    script.register_looped("bountyloop", function(script)
        if(bountyloop:is_enabled()) then 
            self:TriggerTransaction(0xC4F96E65);
            script:sleep(1000);
            self:TriggerTransaction(0xC4F96E65);
        end
    end)
      
    
    script.register_looped("walletbank", function(script)
        if(checkboxwb:is_enabled()) then
            NETSHOPPING.NET_GAMESERVER_TRANSFER_WALLET_TO_BANK(self:GetCharacter(), MONEY.NETWORK_GET_VC_WALLET_BALANCE(self:GetCharacter()))
        end
    end)
    
    for _, stealth in ipairs(self:GetTransactionList()) do
        sub_transactionL:add_button(stealth.label, function()
            self:TriggerTransaction(stealth.hash)
        end)
    end    
end



TransactionManager.new():Init()
