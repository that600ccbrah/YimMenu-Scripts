local Drops = gui.get_tab("Money Drops UNSAFE USE FSL")
Drops:add_button("Cash Loop (On/Off)", function()
   kcashLoop = not kcashLoop
 
    script.register_looped("kcashLoop", function(script)
        local model = joaat("prop_cash_pile_01")
        local pickup = joaat("PICKUP_MONEY_VARIABLE")
        local player_id = PLAYER.PLAYER_ID()
        local money_value = 2000
 
        STREAMING.REQUEST_MODEL(model)
        while STREAMING.HAS_MODEL_LOADED(model) == false do
            script:yield()
        end
 
        if STREAMING.HAS_MODEL_LOADED(model) then
		gui.show_message("Cash Drop", "SELF CASH STARTED")
            local coords = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(player_id), true)
            local objectIdSpawned = OBJECT.CREATE_AMBIENT_PICKUP(
                pickup,
                coords.x,
                coords.y,
                coords.z + 1,
                3,
                money_value,
                model,
                true,
                false
            )
 
            local net_id = NETWORK.OBJ_TO_NET(objectIdSpawned)
            NETWORK.SET_NETWORK_ID_EXISTS_ON_ALL_MACHINES(objectIdSpawned, true)
        end
        if not kcashLoop then
            script.unregister_script("kcashLoop")
        end
    end)
end)