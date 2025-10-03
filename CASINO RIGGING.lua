--Required Stats----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--Required Stats----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local function MPX()
	local PI = stats.get_int("MPPLY_LAST_MP_CHAR")
	if PI == 0 then
		return "MP0_"
	elseif PI == 1 then
		return "MP1_"
	else
		return "MP0_"
	end
end

local function SPX()
	local PI = ENTITY.GET_ENTITY_MODEL(PLAYER.PLAYER_PED_ID())
	if PI == joaat("Player_Zero") then
		return "SP0_"
	elseif PI == joaat("Player_One") then
		return "SP1_"
	elseif PI == joaat("Player_Two") then
		return "SP2_"
	else
		return "SP0_"
	end
end

is_player_male = (ENTITY.GET_ENTITY_MODEL(PLAYER.PLAYER_PED_ID()) == joaat("mp_m_freemode_01"))

local currentlevel = stats.get_int(MPX() .. "CHAR_RANK_FM")
local currentrp = stats.get_int(MPX() .. "CHAR_XP_FM")
local currentcrewlevel = stats.get_int("MPPLY_CURRENT_CREW_RANK")

script.register_looped("AutoStatsUpdater", function(script)
    local success, err = pcall(function()
        local newlevel = stats.get_int(MPX() .. "CHAR_RANK_FM")
        local newrp = stats.get_int(MPX() .. "CHAR_XP_FM")
        local newcrewlevel = stats.get_int("MPPLY_CURRENT_CREW_RANK")

        if newlevel ~= currentlevel or newrp ~= currentrp or newcrewlevel ~= currentcrewlevel then
            currentlevel = newlevel
            currentrp = newrp
            currentcrewlevel = newcrewlevel
        end
    end)
    
    if not success then
        gui.show_message("Stats Update Error", "Failed to update stats: " .. tostring(err))
    end
end)

--Required Scripts--

FMC = "fm_mission_controller"
FMMCL = "fmmc_launcher"
FMC2020 = "fm_mission_controller_2020"
HIP = "heist_island_planning"

--Globals & Locals & Variables--

FMg = 262145 -- free mode global ("CASH_MULTIPLIER") //correct
CSg1    = 1575038 						-- change session (type) 1 					// Guide:   NETWORK::UGC_SET_USING_OFFLINE_CONTENT(false);
CSg2    = 1574589 						-- change session (switch) 2 				// Guide:   MP_POST_MATCH_TRANSITION_SCENE
CSg3    = 1574589 + 2 					-- change session (quit) 3 					// Guide:   MP_POST_MATCH_TRANSITION_SCENE

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
GSXR = gui.get_tab("?CASINO RIG?")

GSXR:add_text("                     >CASINO RIG BY GSXRMODZ FOR 1.71<")
GSXR:add_text("                               >V1.2<")

GSXR:add_text("Your level                " .. stats.get_int(MPX() .. "CHAR_RANK_FM"))

GSXR:add_text("Your RP Value      " .. stats.get_int(MPX() .. "CHAR_XP_FM"))

GSXR:add_text("Current Crew Level   " .. stats.get_int("MPPLY_CURRENT_CREW_RANK"))

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
OnlineServicesMenu = GSXR:add_tab("Casino Options")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CasinoServicesMenu = OnlineServicesMenu:add_tab("Casino Services Menu")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local cslots = "casino_slots"
slots_random_results_table = 1370
prize_wheel_win_state = 300 
prize_wheel_prize = 14
prize_wheel_prize_state = 45

CasinoServicesMenu:add_text("Casino Chips")
chipsVal = 1800
CasinoServicesMenu:add_imgui(function()
	chipsVal, used = ImGui.SliderInt("Casino Chips Buy Limit", chipsVal, 1800, 2147483647)
	if used then
		globals.set_int(CCBL0, chipsVal)
		globals.set_int(CCBL1, chipsVal)
	end
end)

CasinoServicesMenu:add_button("Bypass Casino Cooldown", function()
	stats.set_int("MPPLY_CASINO_CHIPS_WON_GD", 0)
	stats.set_int("MPPLY_CASINO_CHIPS_WONTIM", 0)
	stats.set_int("MPPLY_CASINO_GMBLNG_GD", 0)
	stats.set_int("MPPLY_CASINO_BAN_TIME", 0)
	stats.set_int("MPPLY_CASINO_CHIPS_PURTIM", 0)
	stats.set_int("MPPLY_CASINO_CHIPS_PUR_GD", 0)
	stats.set_int("MPPLY_CASINO_CHIPS_SOLD", 0)
	stats.set_int("MPPLY_CASINO_CHIPS_SELTIM", 0)
end)
CasinoServicesMenu:add_text("Winning too much too quickly might get you banned, enable this at your own risk.")

CasinoServicesMenu:add_separator()

CasinoServicesMenu:add_text("Slots")

CasinoServicesMenu:add_button("Rig Slot Machines", function()
	for i = 3, 196 do
		if i ~= 67 and i ~= 132 then
			locals.set_int(cslots, slots_random_results_table + i, 6)
		end
	end
end)

CasinoServicesMenu:add_button("Lose Slot Machines", function()
	for i = 3, 196 do
		if i ~= 67 and i ~= 132 then
			locals.set_int(cslots, slots_random_results_table + i, 0)
		end
	end
end)

CasinoServicesMenu:add_separator()
CasinoServicesMenu:add_text("Lucky Wheel")

CasinoServicesMenu:add_button("Give Podium Vehicle", function()
	script.run_in_fiber(function(script)
		if SCRIPT.GET_NUMBER_OF_THREADS_RUNNING_THE_SCRIPT_WITH_THIS_HASH(joaat("casino_lucky_wheel")) ~= 0 then
			locals.set_int("casino_lucky_wheel", prize_wheel_win_state + prize_wheel_prize, 18)
			locals.set_int("casino_lucky_wheel", prize_wheel_win_state + prize_wheel_prize_state, 11)
		end
	end)
end)
CasinoServicesMenu:add_sameline()
CasinoServicesMenu:add_button("Give Mystery Prize", function()
	script.run_in_fiber(function(script)
		if SCRIPT.GET_NUMBER_OF_THREADS_RUNNING_THE_SCRIPT_WITH_THIS_HASH(joaat("casino_lucky_wheel")) ~= 0 then
			locals.set_int("casino_lucky_wheel", prize_wheel_win_state + prize_wheel_prize, 11)
			locals.set_int("casino_lucky_wheel", prize_wheel_win_state + prize_wheel_prize_state, 11)
		end
	end)
end)
CasinoServicesMenu:add_sameline()
CasinoServicesMenu:add_button("Give $50,000", function()
	script.run_in_fiber(function(script)
		if SCRIPT.GET_NUMBER_OF_THREADS_RUNNING_THE_SCRIPT_WITH_THIS_HASH(joaat("casino_lucky_wheel")) ~= 0 then
			locals.set_int("casino_lucky_wheel", prize_wheel_win_state + prize_wheel_prize, 19)
			locals.set_int("casino_lucky_wheel", prize_wheel_win_state + prize_wheel_prize_state, 11)
		end
	end)
end)
CasinoServicesMenu:add_sameline()
CasinoServicesMenu:add_button("Give 25,000 Chips", function()
	script.run_in_fiber(function(script)
		if SCRIPT.GET_NUMBER_OF_THREADS_RUNNING_THE_SCRIPT_WITH_THIS_HASH(joaat("casino_lucky_wheel")) ~= 0 then
			locals.set_int("casino_lucky_wheel", prize_wheel_win_state + prize_wheel_prize, 15)
			locals.set_int("casino_lucky_wheel", prize_wheel_win_state + prize_wheel_prize_state, 11)
		end
	end)
end)
CasinoServicesMenu:add_button("Give 15,000RP", function()
	script.run_in_fiber(function(script)
		if SCRIPT.GET_NUMBER_OF_THREADS_RUNNING_THE_SCRIPT_WITH_THIS_HASH(joaat("casino_lucky_wheel")) ~= 0 then
			locals.set_int("casino_lucky_wheel", prize_wheel_win_state + prize_wheel_prize, 17)
			locals.set_int("casino_lucky_wheel", prize_wheel_win_state + prize_wheel_prize_state, 11)
		end
	end)
end)
CasinoServicesMenu:add_sameline()
CasinoServicesMenu:add_button("Give Discount", function()
	script.run_in_fiber(function(script)
		if SCRIPT.GET_NUMBER_OF_THREADS_RUNNING_THE_SCRIPT_WITH_THIS_HASH(joaat("casino_lucky_wheel")) ~= 0 then
			locals.set_int("casino_lucky_wheel", prize_wheel_win_state + prize_wheel_prize, 4)
			locals.set_int("casino_lucky_wheel", prize_wheel_win_state + prize_wheel_prize_state, 11)
		end
	end)
end)
CasinoServicesMenu:add_sameline()
CasinoServicesMenu:add_button("Give Clothing", function()
	script.run_in_fiber(function(script)
		if SCRIPT.GET_NUMBER_OF_THREADS_RUNNING_THE_SCRIPT_WITH_THIS_HASH(joaat("casino_lucky_wheel")) ~= 0 then
			locals.set_int("casino_lucky_wheel", prize_wheel_win_state + prize_wheel_prize, 8)
			locals.set_int("casino_lucky_wheel", prize_wheel_win_state + prize_wheel_prize_state, 11)
		end
	end)
end)
