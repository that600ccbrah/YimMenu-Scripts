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

-- Apartment Heist
ACg1 = 1931323 + 1 + 1 -- global apartment player 1 cut global ("fmmc_launcher")
ACg2 = 1931323 + 1 + 2 -- global apartment player 2 cut global ("fmmc_launcher")
ACg3 = 1931323 + 1 + 3 -- global apartment player 3 cut global ("fmmc_launcher")
ACg4 = 1931323 + 1 + 4 -- global apartment player 4 cut global ("fmmc_launcher")
ACg5 = 1933291 + 3008 + 1 -- local apartment player 1 cut global ("fmmc_launcher")
AUAJg1 = FMg + 9101 -- apartment unlock all jobs global 1 ("ROOT_ID_HASH_THE_FLECCA_JOB")
AUAJg2 = FMg + 9106 -- apartment unlock all jobs global 2 ("ROOT_ID_HASH_THE_PRISON_BREAK")
AUAJg3 = FMg + 9113 -- apartment unlock all jobs global 3 ("ROOT_ID_HASH_THE_HUMANE_LABS_RAID")
AUAJg4 = FMg + 9119 -- apartment unlock all jobs global 4 ("ROOT_ID_HASH_SERIES_A_FUNDING")
AUAJg5 = FMg + 9125 -- apartment unlock all jobs global 5 ("ROOT_ID_HASH_THE_PACIFIC_STANDARD_JOB")
AIFl3 = 19787 -- apartment instant finish local 1
AIFl4 = 19787 + 2686 -- apartment instant finish local 2
AIFl5 = 28407 + 1 -- apartment instant finish local 3
AIFl6 = 31663 + 1 + 68
AFHl = 11818 + 24 -- apartment fleeca hack local
AFDl = 10107 + 11 -- apartment fleeca drill local
AHSo = 19789  -- Apartment heist skip checkpoint

-- Diamond Casino Heist
DCRBl = 208 -- diamond casino reload board local
DCCg1 = 1967717 + 1497 + 736 + 92 + 1 -- diamond casino player 1 cut global ("gb_casino_heist_planning")
DCCg2 = 1967717 + 1497 + 736 + 92 + 2 -- diamond casino player 2 cut global ("gb_casino_heist_planning")
DCCg3 = 1967717 + 1497 + 736 + 92 + 3 -- diamond casino player 3 cut global ("gb_casino_heist_planning")
DCCg4 = 1967717 + 1497 + 736 + 92 + 4 -- diamond casino player 4 cut global ("gb_casino_heist_planning")
DCCl = FMg + 28313 -- ("CH_LESTER_CUT")
DCCh = FMg + 28349 - 1 --("2027377935")
DCCd = FMg + 28344 - 1 --("88090906")
DCCgun = FMg + 28339 - 1 --("74718927")
DCFHl = 53127 -- diamond casino fingerprint hack local
DCKHl = 54193 -- diamond casino keypad hack local
DCDVDl1 = 10107 + 7 -- diamond casino drill vault door local 1 --("DLC_HEIST_MINIGAME_FLEECA_DRILLING_SCENE") in ("fm_mission_controller")
DCDVDl2 = 10107 + 37 -- diamond casino drill vault door local 2 --("fm_mission_controller")
DCXf1 = 19787
DCXf2 = 19787 + 1062
DCXf3 = 19787 + 1740 + 1
DCXf4 = 19787 + 2686
DCXf5 = 28407 + 1
DCXf6 = 31663 + 1 + 68

-- Cayo Perico Heist
CPRSl = 1566 -- cayo perico reload screen local
CPCg1 = 1974520 + 831 + 56 + 1 -- cayo perico player 1 cut global --("heist_island_planning")
CPCg2 = 1974520 + 831 + 56 + 2 -- cayo perico player 2 cut global --("heist_island_planning")
CPCg3 = 1974520 + 831 + 56 + 3 -- cayo perico player 3 cut global --("heist_island_planning")
CPCg4 = 1974520 + 831 + 56 + 4 -- cayo perico player 4 cut global --("heist_island_planning")
CPFHl = 25058 -- cayo perico fingerprint hack local ("heist") in ("fm_mission_controller_2020")
CPPCCl = 31123 + 3 -- cayo perico plasma cutter cut local ("DLC_H4_anims_glass_cutter_Sounds") in ("fm_mission_controller_2020")
CPSTCl = 29883 -- cayo perico drainage pipe cut local ("IntroFinished") in ("fm_mission_controller_2020")
CPXf1 = 54353 -- cayo perico instant finish local 1
CPXf2 = 54353 + 1776 + 1 -- cayo perico instant finish local 2

-- Doomsday Heist
DDSHl = 1294 + 135 -- doomsday doomsday scenario hack local
DCg1 = 1963610 + 812 + 50 + 1 -- doomsday player 1 cut global --("gb_gang_ops_planning")
DCg2 = 1963610 + 812 + 50 + 2 -- doomsday player 2 cut global --("gb_gang_ops_planning")
DCg3 = 1963610 + 812 + 50 + 3 -- doomsday player 3 cut global --("gb_gang_ops_planning")
DCg4 = 1963610 + 812 + 50 + 4 -- doomsday player 4 cut global --("gb_gang_ops_planning")

IHPB = 54353 --Instant Heist Passed Local Base (Casino And CayoPerico)
IHPL = 54353 + 1776 + 1 --Instant Heist Passed Locals (Casino And CayoPerico)

NLCl = 204 + 32 + 1 --("nightclub_office_cutscene") in ("am_mp_nightclub")

SNOW = FMg + 4413
halloweatherAddress = FMg + 32157

--BV = Ballastic Value----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

BV = FMg + 20024

--CCBL = Casino Chips Buy Limit-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CCBL0 = FMg + 26534
CCBL1 = FMg + 26535

--BAS=Bag Size------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

BAS1 = FMg + 29210

--PSV=Panther Statue-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

PSV = FMg + 29462

--PDIAMOND=Pink Diamond---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

PDIAMOND = FMg + 29460

--BB=Bearer Bonds---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

BB = FMg + 29459

--RN=Ruby Necklace--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

RN = FMg + 29458

--TEQUILA=Tequila---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

TEQUILA = FMg + 29457

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

GSXR = gui.get_tab("HEIST CONTROL")

GSXR:add_text("                      HEIST CONTROL FOR 1.71")
GSXR:add_text("                               BY GSXRMODZ")

GSXR:add_imgui(function()
    ImGui.Text("Your level                " .. currentlevel)
    ImGui.Text("Your RP Value      " .. currentrp)
    ImGui.Text("Current Crew Level   " .. currentcrewlevel)
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------



HeistsDataEditorMenu = GSXR:add_tab("Heists Data Editor Menu")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

ApartmentDataEditorMenu = HeistsDataEditorMenu:add_tab("Apartment Data Editor Menu")

ApartmentDataEditorMenu:add_button("Skip Preps", function()
	stats.set_int(MPX() .. "HEIST_PLANNING_STAGE", -1)
end)

ApartmentDataEditorMenu:add_sameline()

ApartmentDataEditorMenu:add_button("Reset Preps", function()
	stats.set_int(MPX() .. "HEIST_PLANNING_STAGE", 0)
end)

ApartmentDataEditorMenu:add_text("")
ApartmentDataEditorMenu:add_text("For Fleeca:")
ApartmentDataEditorMenu:add_text(
	'Pay for the preparation, start the first mission and as soon as you are sent to scout\nchange the session, come back to planning room, press "Complete Preps" near white board and press "E"'
)
ApartmentDataEditorMenu:add_text("For Other Heist:")
ApartmentDataEditorMenu:add_text(
	'Start the mission and leave after the 1st cutscene ends, press "Complete Preps" near white board and press "E"'
)

ApartmentDataEditorMenu:add_separator()
ApartmentDataEditorMenu:add_text("Cuts to All")
ApartmentDataEditorMenu:add_text("Fleeca Job Heist:")
ApartmentDataEditorMenu:add_button("100", function()
	globals.set_int(ACg1, -200)
	globals.set_int(ACg2, 100)
end)
ApartmentDataEditorMenu:add_text("")
ApartmentDataEditorMenu:add_text("Other Heists:")
ApartmentDataEditorMenu:add_button("100", function()
	globals.set_int(ACg1, -300)
	globals.set_int(ACg2, 100)
	globals.set_int(ACg3, 100)
	globals.set_int(ACg4, 100)
end)

local apartCut1 = 0
local apartCut2 = 0
local apartCut3 = 0
local apartCut4 = 0
ApartmentDataEditorMenu:add_imgui(function()
	ImGui.Text("Custom Cuts:")
	ImGui.SetNextItemWidth(150)
	apartCut1 = ImGui.InputInt("Cut 1", apartCut1)
	ImGui.SameLine()
	ImGui.SetNextItemWidth(150)
	apartCut2 = ImGui.InputInt("Cut 2", apartCut2)
	ImGui.SetNextItemWidth(150)
	apartCut3 = ImGui.InputInt("Cut 3", apartCut3)
	ImGui.SameLine()
	ImGui.SetNextItemWidth(150)
	apartCut4 = ImGui.InputInt("Cut 4", apartCut4)
	ImGui.Text("For Fleeca Heist")
	if ImGui.Button("Set Cuts") then
		globals.set_int(ACg1, 100 - (apartCut1 * 2))
		globals.set_int(ACg2, apartCut2)
	end
	ImGui.Text("For Other Heists")
	if ImGui.Button("Set Cuts") then
		globals.set_int(ACg1, 100 - (apartCut1 * 4))
		globals.set_int(ACg2, apartCut2)
		globals.set_int(ACg3, apartCut3)
		globals.set_int(ACg4, apartCut4)
	end
	if ImGui.Button("Set Negative to Positive (own)") then
		globals.set_int(ACg5, -1 * (-100 + globals.get_int(ACg1)) / 2)
	end
end)
ApartmentDataEditorMenu:add_separator()
ApartmentDataEditorMenu:add_text("Extras")
ApartmentDataEditorMenu:add_button("Bypass Fleeca Hack", function()
	locals.set_int(FMC, AFHl, 7)
end)
ApartmentDataEditorMenu:add_sameline()
ApartmentDataEditorMenu:add_button("Bypass Fleeca Drill", function()
	locals.set_float(FMC, AFDl, 100)
end)
ApartmentDataEditorMenu:add_sameline()
ApartmentDataEditorMenu:add_button("Skip Checkpoint", function()
    locals.set_int(FMC, AHSo, locals.get_int(FMC, AHSo) | (1 << 17))
end
)
ApartmentDataEditorMenu:add_button("Play the Heist Alone",
function()
	if locals.get_int(FMMCL, 19990 + 34) ~= nil then
		if locals.get_int(FMMCL, 19990 + 34) ~= 0 then
			if locals.get_int(FMMCL, 19990 + 34) > 1 then
					locals.set_int(FMMCL, 19990 + 15, 1)
                    globals.set_int(794954 + 4 + 1 + (locals.get_int(FMMCL, 19990 + 34) * 95) + 75, 1)
			end
			globals.set_int(4718592 + 3539, 1)
            globals.set_int(4718592 + 3540, 1)
            globals.set_int(4718592 + 3542 + 1, 1)
            globals.set_int(4718592 + 184007 + 1, 0)
		end
	end
end)
ApartmentDataEditorMenu:add_sameline()
ApartmentDataEditorMenu:add_button("Unlock All Jobs", function()
	stats.set_int(MPX() .. "HEIST_SAVED_STRAND_0", globals.get_int(AUAJg1))
	stats.set_int(MPX() .. "HEIST_SAVED_STRAND_0_L", 5)
	stats.set_int(MPX() .. "HEIST_SAVED_STRAND_1", globals.get_int(AUAJg2))
	stats.set_int(MPX() .. "HEIST_SAVED_STRAND_1_L", 5)
	stats.set_int(MPX() .. "HEIST_SAVED_STRAND_2", globals.get_int(AUAJg3))
	stats.set_int(MPX() .. "HEIST_SAVED_STRAND_2_L", 5)
	stats.set_int(MPX() .. "HEIST_SAVED_STRAND_3", globals.get_int(AUAJg4))
	stats.set_int(MPX() .. "HEIST_SAVED_STRAND_3_L", 5)
	stats.set_int(MPX() .. "HEIST_SAVED_STRAND_4", globals.get_int(AUAJg5))
	stats.set_int(MPX() .. "HEIST_SAVED_STRAND_4_L", 5)
end)
ApartmentDataEditorMenu:add_sameline()
ApartmentDataEditorMenu:add_button("Instant Finish",
function()
	locals.set_int(FMC, AIFl3, 12)
	locals.set_int(FMC, AIFl4, 99999)
	locals.set_int(FMC, AIFl5, 99999)
	locals.set_int(FMC, AIFl6, 99999)
end
)
ApartmentDataEditorMenu:add_sameline()
ApartmentDataEditorMenu:add_button("Instant Finish (Pacific Standard)", function()
    locals.set_int(FMC, 19787 + 1062, 5)
    locals.set_int(FMC, 19787 + 1740 + 1, 80)
    locals.set_int(FMC, 19787 + 2686, 10000000)
    locals.set_int(FMC, 28407 + 1, 99999)
    locals.set_int(FMC, 31663 + 1 + 68, 99999)
end
)
ApartmentDataEditorMenu:add_text("Note: After Clicking Unlock All jobs, restart the game")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CasinoHeistEditorMenu = HeistsDataEditorMenu:add_tab("Casino Heist")

CasinoHeistEditorMenu:add_button("One Click Setup Casino Silent&Sneaky", function()
	stats.set_int(MPX() .. "H3OPT_APPROACH", 1)
	stats.set_int(MPX() .. "H3_LAST_APPROACH", 3)
	stats.set_int(MPX() .. "H3OPT_TARGET", 3)
	stats.set_int(MPX() .. "H3OPT_BITSET1", 127)
	stats.set_int(MPX() .. "H3OPT_DISRUPTSHIP", 3)
	stats.set_int(MPX() .. "H3OPT_KEYLEVELS", 2)
	stats.set_int(MPX() .. "H3OPT_CREWWEAP", 4)
	stats.set_int(MPX() .. "H3OPT_CREWDRIVER", 5)
	stats.set_int(MPX() .. "H3OPT_CREWHACKER", 5)
	stats.set_int(MPX() .. "H3OPT_VEHS", 2)
	stats.set_int(MPX() .. "H3OPT_WEAPS", 1)
	stats.set_int(MPX() .. "H3OPT_BITSET0", 262399)
	stats.set_int(MPX() .. "H3OPT_MASKS", 2)
end)

CasinoHeistEditorMenu:add_button("One Click Setup Casino The Big Con. Mode", function()
	stats.set_int(MPX() .. "H3OPT_APPROACH", 2)
	stats.set_int(MPX() .. "H3_LAST_APPROACH", 3)
	stats.set_int(MPX() .. "H3OPT_TARGET", 3)
	stats.set_int(MPX() .. "H3OPT_BITSET1", 799)
	stats.set_int(MPX() .. "H3OPT_DISRUPTSHIP", 3)
	stats.set_int(MPX() .. "H3OPT_KEYLEVELS", 2)
	stats.set_int(MPX() .. "H3OPT_CREWWEAP", 4)
	stats.set_int(MPX() .. "H3OPT_CREWDRIVER", 5)
	stats.set_int(MPX() .. "H3OPT_CREWHACKER", 5)
	stats.set_int(MPX() .. "H3OPT_VEHS", 2)
	stats.set_int(MPX() .. "H3OPT_WEAPS", 0)
	stats.set_int(MPX() .. "H3OPT_BITSET0", 913623)
	stats.set_int(MPX() .. "H3OPT_MASKS", 2)
end)

CasinoHeistEditorMenu:add_button("One Click Setup Casino Aggressive Mode", function()
	stats.set_int(MPX() .. "H3OPT_APPROACH", 3)
	stats.set_int(MPX() .. "H3_LAST_APPROACH", 1)
	stats.set_int(MPX() .. "H3OPT_TARGET", 3)
	stats.set_int(MPX() .. "H3OPT_BITSET1", 799)
	stats.set_int(MPX() .. "H3OPT_DISRUPTSHIP", 3)
	stats.set_int(MPX() .. "H3OPT_KEYLEVELS", 2)
	stats.set_int(MPX() .. "H3OPT_CREWWEAP", 4)
	stats.set_int(MPX() .. "H3OPT_CREWDRIVER", 5)
	stats.set_int(MPX() .. "H3OPT_CREWHACKER", 5)
	stats.set_int(MPX() .. "H3OPT_VEHS", 2)
	stats.set_int(MPX() .. "H3OPT_WEAPS", 1)
	stats.set_int(MPX() .. "H3OPT_BITSET0", 1835223)
	stats.set_int(MPX() .. "H3OPT_MASKS", 2)
end)

CasinoHeistEditorMenu:add_text("Preps")
CasinoHeistEditorMenu:add_text("")
local function CasinoApproachSetter(last_approach, hard_approach, approach, selected_approach)
	stats.set_int(MPX() .. "H3_LAST_APPROACH", last_approach)
	stats.set_int(MPX() .. "H3_HARD_APPROACH", hard_approach)
	stats.set_int(MPX() .. "H3_APPROACH", approach)
	stats.set_int(MPX() .. "H3OPT_APPROACH", selected_approach)
end
local function CasinoCompletePreps()
	stats.set_int(MPX() .. "H3OPT_DISRUPTSHIP", 3)
	stats.set_int(MPX() .. "H3OPT_KEYLEVELS", 2)
	stats.set_int(MPX() .. "H3OPT_BITSET0", -1)
	stats.set_int(MPX() .. "H3OPT_BITSET1", -1)
	stats.set_int(MPX() .. "H3OPT_COMPLETEDPOSIX", -1)
end
CasinoHeistEditorMenu:add_text("Primary Target")
CasinoHeistEditorMenu:add_button("Diamond", function()
	stats.set_int(MPX() .. "H3OPT_TARGET", 3)
end)
CasinoHeistEditorMenu:add_sameline()
CasinoHeistEditorMenu:add_button("Gold", function()
	stats.set_int(MPX() .. "H3OPT_TARGET", 1)
end)
CasinoHeistEditorMenu:add_sameline()
CasinoHeistEditorMenu:add_button("Arts", function()
	stats.set_int(MPX() .. "H3OPT_TARGET", 2)
end)
CasinoHeistEditorMenu:add_sameline()
CasinoHeistEditorMenu:add_button("Cash", function()
	stats.set_int(MPX() .. "H3OPT_TARGET", 0)
end)
CasinoHeistEditorMenu:add_separator()
CasinoHeistEditorMenu:add_text("Select Apprach")
CasinoHeistEditorMenu:add_button("Silent & Sneaky", function()
	CasinoApproachSetter(2, 1, 3, 1)
	STATS.STAT_SET_INT(MPX() .. "H3OPT_BITSET1", 127)
	stats.set_int(MPX() .. "H3OPT_WEAPS", 0)
end)
CasinoHeistEditorMenu:add_sameline()
CasinoHeistEditorMenu:add_button("Big Con", function()
	CasinoApproachSetter(1, 2, 3, 2)
	STATS.STAT_SET_INT(MPX() .. "H3OPT_BITSET1", 799)
	stats.set_int(MPX() .. "H3OPT_WEAPS", 0)
end)
CasinoHeistEditorMenu:add_sameline()
CasinoHeistEditorMenu:add_button("Aggressive", function()
	CasinoApproachSetter(2, 3, 1, 3)
	STATS.STAT_SET_INT(MPX() .. "H3OPT_BITSET1", 799)
	stats.set_int(MPX() .. "H3OPT_WEAPS", 0)
end)
CasinoHeistEditorMenu:add_separator()
CasinoHeistEditorMenu:add_text("Gun Man")
local gunman = 0
local driver = 0
local hacker = 0
local mask = 0
local casinoPc1 = 0
local casinoPc2 = 0
local casinoPc3 = 0
local casinoPc4 = 0
local GunManLoadoutSi = {
	"Karl Abolaji/Micro SMG",
	"Karl Abolaji/Machine Pistol",
	"Charlie Reed/Assault SMG",
	"Charlie Reed/Bullpup Shotgun",
	"Patrick McReary/Combat PDW",
	"Patrick McReary/Assault Rifle",
	"Gustavo Mota/Carbine Rifle",
	"Gustavo Mota/Assault Shotgun",
	"Chester McCoy/Pump Shotgun Mk II",
	"Chester McCoy/Carbine Rifle Mk II",
}
local GunManLoadoutBC = {
	"Karl Abolaji/Micro SMG",
	"Karl Abolaji/Double Barrel Shotgun",
	"Charlie Reed/Machine Pistol",
	"Charlie Reed/Sweeper Shotgun",
	"Patrick McReary/Sawed-Off Shotgun",
	"Patrick McReary/Compact Rifle",
	"Gustavo Mota/Carbine Rifle",
	"Gustavo Mota/Assault Shotgun",
	"Chester McCoy/SMG Mk II",
	"Chester McCoy/Bullpup Rifle Mk II",
}
local GunManLoadoutAg = {
	"Karl Abolaji/Sawed-Off Shotgun",
	"Karl Abolaji/Heavy Revolver",
	"Charlie Reed/Assault SMG",
	"Charlie Reed/Pump Shotgun",
	"Patrick McReary/Heavy Shotgun",
	"Patrick McReary/Combat MG",
	"Gustavo Mota/Carbine Rifle",
	"Gustavo Mota/Assault Shotgun",
	"Chester McCoy/Pump Shotgun Mk II",
	"Chester McCoy/Assault Rifle Mk II",
}
local DriverLoad = {
	"Karim Denz/Issi Classic",
	"Karim Denz/Asbo",
	"Karim Denz/Blista Kanjo",
	"Karim Denz/Sentinel Classic",
	"Zach Nelson/Manchez",
	"Zach Nelson/Stryder",
	"Zach Nelson/Defiler",
	"Zach Nelson/Lectro",
	"Taliana Martinez/Retinue Mk II",
	"Taliana Martinez/Drift Yosemite",
	"Taliana Martinez/Sugoi",
	"Taliana Martinez/Jugular",
	"Eddie Toh/Sultan Classic",
	"Eddie Toh/Gauntlet Classic",
	"Eddie Toh/Ellie",
	"Eddie Toh/Komoda",
	"Chester McCoy/Zhaba",
	"Chester McCoy/Vagrant",
	"Chester McCoy/Outlaw",
	"Chester McCoy/Everon",
}
local hackerLoad = {
	"Select",
	"Rickie Lukens",
	"Christian Feltz",
	"Yohan Blair",
	"Avi Schwartzman",
	"Page Harris",
}
local maskLoad = {
	"Select",
	"Geometic Set",
	"Hunter Set",
	"Oni Half Mask Set",
	"Emoji Set",
	"Ornate Skull Set",
	"Lucky Fruit Set",
	"Guerilla Set",
	"Clown Set",
	"Animal Set",
	"Riot Set",
	"Oni Full Mask Set",
	"Hockey Set",
}
CasinoHeistEditorMenu:add_imgui(function()
	if stats.get_int(MPX() .. "H3OPT_APPROACH") == 1 then
		ImGui.SetNextItemWidth(265)
		gunman = ImGui.Combo("Loadout", gunman, GunManLoadoutSi, 10)
	elseif stats.get_int(MPX() .. "H3OPT_APPROACH") == 2 then
		ImGui.SetNextItemWidth(265)
		gunman = ImGui.Combo("Loadout", gunman, GunManLoadoutBC, 10)
	elseif stats.get_int(MPX() .. "H3OPT_APPROACH") == 3 then
		ImGui.SetNextItemWidth(265)
		gunman = ImGui.Combo("Loadout", gunman, GunManLoadoutAg, 10)
	end

	if ImGui.Button("Set Loadout") then
		ImGui.Text(gunman)
		if gunman <= 1 then
			stats.set_int(MPX() .. "H3OPT_CREWWEAP", 1)
			stats.set_int(MPX() .. "H3OPT_WEAPS", gunman)
		elseif gunman <= 4 then
			stats.set_int(MPX() .. "H3OPT_CREWWEAP", 3)
			stats.set_int(MPX() .. "H3OPT_WEAPS", gunman - 2)
		elseif gunman <= 6 then
			stats.set_int(MPX() .. "H3OPT_CREWWEAP", 5)
			stats.set_int(MPX() .. "H3OPT_WEAPS", gunman - 4)
		elseif gunman <= 8 then
			stats.set_int(MPX() .. "H3OPT_CREWWEAP", 2)
			stats.set_int(MPX() .. "H3OPT_WEAPS", gunman - 6)
		elseif gunman <= 10 then
			stats.set_int(MPX() .. "H3OPT_CREWWEAP", 4)
			stats.set_int(MPX() .. "H3OPT_WEAPS", gunman - 8)
		end
	end
	ImGui.Separator()
	ImGui.Text("Getaway Vehicles")
	ImGui.SetNextItemWidth(265)
	driver = ImGui.Combo("", driver, DriverLoad, 20)
	if ImGui.Button("Set Getaway Vehicle") then
		ImGui.Text(driver)
		if driver <= 3 then
			stats.set_int(MPX() .. "H3OPT_CREWDRIVER", 1)
			stats.set_int(MPX() .. "H3OPT_VEHS", driver)
		elseif driver <= 7 then
			stats.set_int(MPX() .. "H3OPT_CREWDRIVER", 4)
			stats.set_int(MPX() .. "H3OPT_VEHS", driver - 4)
		elseif driver <= 11 then
			stats.set_int(MPX() .. "H3OPT_CREWDRIVER", 2)
			stats.set_int(MPX() .. "H3OPT_VEHS", driver - 8)
		elseif driver <= 15 then
			stats.set_int(MPX() .. "H3OPT_CREWDRIVER", 3)
			stats.set_int(MPX() .. "H3OPT_VEHS", driver - 12)
		elseif driver <= 19 then
			stats.set_int(MPX() .. "H3OPT_CREWDRIVER", 5)
			stats.set_int(MPX() .. "H3OPT_VEHS", driver - 16)
		end
	end
	ImGui.Separator()
	ImGui.Text("Hacker")
	ImGui.SetNextItemWidth(265)
	hacker = ImGui.Combo("Hacker", hacker, hackerLoad, 6)
	if ImGui.Button("Set Hacker") then
		ImGui.Text(hacker)
		stats.set_int(MPX() .. "H3OPT_CREWHACKER", hacker)
	end
	ImGui.Separator()
	ImGui.Text("Mask")
	ImGui.SetNextItemWidth(265)
	ImGui.SetNextItemWidth(265)
	mask = ImGui.Combo("Masks", mask, maskLoad, 13)
	if ImGui.Button("Set Mask") then
		ImGui.Text(mask)
		stats.set_int(MPX() .. "H3OPT_MASKS", mask)
	end
	ImGui.Separator()
	if ImGui.Button("Complete preps") then
		CasinoCompletePreps()
	end
	ImGui.Separator()
	ImGui.Text("Cuts")
	ImGui.Text("Preset Cut")
	if ImGui.Button("Set Cut to 100") then
		CutsPresetter(DCCg1, DCCg4, 100)
	end
	casinoPc1 = ImGui.InputInt("Player Cut 1", casinoPc1)
	casinoPc2 = ImGui.InputInt("Player Cut 2", casinoPc2)
	casinoPc3 = ImGui.InputInt("Player Cut 3", casinoPc3)
	casinoPc4 = ImGui.InputInt("Player Cut 4", casinoPc4)
	if ImGui.Button("Set Player Cuts") then
		globals.set_int(DCCg1, casinoPc1)
		globals.set_int(DCCg2, casinoPc2)
		globals.set_int(DCCg3, casinoPc3)
		globals.set_int(DCCg4, casinoPc4)
	end
end)
CasinoHeistEditorMenu:add_separator()
CasinoHeistEditorMenu:add_button("Reload Planning Screen", function()
	locals.set_int("gb_casino_heist_planning", DCRBl, 2)
end)

CasinoHeistEditorMenu:add_separator()
CasinoHeistEditorMenu:add_text("Instant Heist Passed")
CasinoHeistEditorMenu:add_button("Instant Finish $$", function()
    local approachType = stats.get_int(MPX() .. "H3OPT_APPROACH")
    if approachType == 3 then
        locals.set_int(FMC, DCXf1, 12)
        locals.set_int(FMC, DCXf3, 80)
        locals.set_int(FMC, DCXf4, 10000000)
        locals.set_int(FMC, DCXf5, 99999)
        locals.set_int(FMC, DCXf6, 99999)
        gui.show_message("Instant Heist Passed", "Activated")
    else    
        locals.set_int(FMC, DCXf2, 12)
        locals.set_int(FMC, DCXf3, 80)
        locals.set_int(FMC, DCXf4, 10000000)
        locals.set_int(FMC, DCXf5, 99999)
        locals.set_int(FMC, DCXf6, 99999)
        gui.show_message("Instant Heist Passed", "Activated")
    end
end)

local CasinoHeistExtra = CasinoHeistEditorMenu:add_tab("Extras")
CasinoHeistExtra:add_text("Make Lester, Driver, Hacker, and Gunman cut to 0%")
CasinoHeistExtra:add_button("Make Fees to 0", function()
	globals.set_int(DCCgun, 0)
	globals.set_int(DCCh, 0)
	globals.set_int(DCCl, 0)
	globals.set_int(DCCd, 0)
end)
CasinoHeistExtra:add_text("Hacks")
CasinoHeistExtra:add_button("Bypass Casino Fingerprint Hack", function()
	if locals.get_int(FMC, DCFHl) == 4 then
		locals.set_int(FMC, DCFHl, 5)
	end
end)
CasinoHeistExtra:add_sameline()
CasinoHeistExtra:add_button("Bypass Keypad Hack", function()
	if locals.get_int(FMC, DCKHl) ~= 4 then
		locals.set_int(FMC, DCKHl, 5)
	end
end)
CasinoHeistExtra:add_sameline()
CasinoHeistExtra:add_button("Bypass Drill Vault Door", function()
	locals.set_int(FMC, DCDVDl1, locals.get_int(FMC, DCDVDl2))
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local CayoHeistEditorMenu = HeistsDataEditorMenu:add_tab("Cayo Perico Editor")

CayoHeistEditorMenu:add_text("Cuts to All")
CayoHeistEditorMenu:add_button("100", function()
	CutsPresetter(CPCg1, CPCg4, 100)
end)
CayoHeistEditorMenu:add_text("")
CayoHeistEditorMenu:add_text("Custom Cut")
local cayocut1 = CayoHeistEditorMenu:add_input_int("Cut 1")
local cayocut2 = CayoHeistEditorMenu:add_input_int("Cut 2")
local cayocut3 = CayoHeistEditorMenu:add_input_int("Cut 3")
local cayocut4 = CayoHeistEditorMenu:add_input_int("Cut 4")
CayoHeistEditorMenu:add_button("Set", function()
	globals.set_int(CPCg1, cayocut1:get_value())
	globals.set_int(CPCg2, cayocut2:get_value())
	globals.set_int(CPCg3, cayocut3:get_value())
	globals.set_int(CPCg4, cayocut4:get_value())
end)
CayoHeistEditorMenu:add_separator()

CayoHeistEditorMenu:add_text("Non-Legit Presets")

CayoHeistEditorMenu:add_button("Panther/Gold (Hard)", function()
	stats.set_int(MPX() .. "H4CNF_BS_GEN", 131071)
	stats.set_int(MPX() .. "H4CNF_BS_ENTR", 63)
	stats.set_int(MPX() .. "H4CNF_BS_ABIL", 63)
	stats.set_int(MPX() .. "H4CNF_WEAPONS", 5)
	stats.set_int(MPX() .. "H4CNF_WEP_DISRP", 3)
	stats.set_int(MPX() .. "H4CNF_ARM_DISRP", 3)
	stats.set_int(MPX() .. "H4CNF_HEL_DISRP", 3)
	stats.set_int(MPX() .. "H4CNF_TARGET", 5)
	stats.set_int(MPX() .. "H4CNF_TROJAN", 2)
	stats.set_int(MPX() .. "H4CNF_APPROACH", -1)
	stats.set_int(MPX() .. "H4LOOT_CASH_I", 0)
	stats.set_int(MPX() .. "H4LOOT_CASH_C", 0)
	stats.set_int(MPX() .. "H4LOOT_WEED_I", 0)
	stats.set_int(MPX() .. "H4LOOT_WEED_C", 0)
	stats.set_int(MPX() .. "H4LOOT_COKE_I", 0)
	stats.set_int(MPX() .. "H4LOOT_COKE_C", 0)
	stats.set_int(MPX() .. "H4LOOT_CASH_I", 0)
	stats.set_int(MPX() .. "H4LOOT_GOLD_I", 0)
	stats.set_int(MPX() .. "H4LOOT_GOLD_C", -1)
	stats.set_int(MPX() .. "H4LOOT_PAINT", 0)
	stats.set_int(MPX() .. "H4_PROGRESS", 131055)
	stats.set_int(MPX() .. "H4LOOT_CASH_I_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_CASH_C_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_WEED_I_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_WEED_C_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_COKE_I_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_COKE_C_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_GOLD_I_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_GOLD_C_SCOPED", -1)
	stats.set_int(MPX() .. "H4LOOT_GOLD_V", 1191817)
	stats.set_int(MPX() .. "H4LOOT_PAINT_SCOPED", 0)
	stats.set_int(MPX() .. "H4_MISSIONS", 65535)
	stats.set_int(MPX() .. "H4_PLAYTHROUGH_STATUS", 32)

	gui.show_message("Cayo Heist", "Panther Hard Mode has been set up!")
	gui.show_message("Cayo Heist", "Reset the board to see the changes")
end)
CayoHeistEditorMenu:add_sameline()
CayoHeistEditorMenu:add_button("Diamond/Gold (Hard)", function()
	stats.set_int(MPX() .. "H4CNF_BS_GEN", 131071)
	stats.set_int(MPX() .. "H4CNF_BS_ENTR", 63)
	stats.set_int(MPX() .. "H4CNF_BS_ABIL", 63)
	stats.set_int(MPX() .. "H4CNF_WEAPONS", 5)
	stats.set_int(MPX() .. "H4CNF_WEP_DISRP", 3)
	stats.set_int(MPX() .. "H4CNF_ARM_DISRP", 3)
	stats.set_int(MPX() .. "H4CNF_HEL_DISRP", 3)
	stats.set_int(MPX() .. "H4CNF_TARGET", 3)
	stats.set_int(MPX() .. "H4CNF_TROJAN", 2)
	stats.set_int(MPX() .. "H4CNF_APPROACH", -1)
	stats.set_int(MPX() .. "H4LOOT_CASH_I", 0)
	stats.set_int(MPX() .. "H4LOOT_CASH_C", 0)
	stats.set_int(MPX() .. "H4LOOT_WEED_I", 0)
	stats.set_int(MPX() .. "H4LOOT_WEED_C", 0)
	stats.set_int(MPX() .. "H4LOOT_COKE_I", 0)
	stats.set_int(MPX() .. "H4LOOT_COKE_C", 0)
	stats.set_int(MPX() .. "H4LOOT_CASH_I", 0)
	stats.set_int(MPX() .. "H4LOOT_GOLD_I", 0)
	stats.set_int(MPX() .. "H4LOOT_GOLD_C", -1)
	stats.set_int(MPX() .. "H4LOOT_PAINT", 0)
	stats.set_int(MPX() .. "H4_PROGRESS", 131055)
	stats.set_int(MPX() .. "H4LOOT_CASH_I_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_CASH_C_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_WEED_I_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_WEED_C_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_COKE_I_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_COKE_C_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_GOLD_I_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_GOLD_C_SCOPED", -1)
	stats.set_int(MPX() .. "H4LOOT_GOLD_V", 1191817)
	stats.set_int(MPX() .. "H4LOOT_PAINT_SCOPED", 0)
	stats.set_int(MPX() .. "H4_MISSIONS", 65535)
	stats.set_int(MPX() .. "H4_PLAYTHROUGH_STATUS", 32)

	gui.show_message("Cayo Heist", "Diamond Hard Mode has been set up!")
	gui.show_message("Cayo Heist", "Reset the board to see the changes")
end)

CayoHeistEditorMenu:add_sameline()
CayoHeistEditorMenu:add_button("Bonds/Gold (Hard)", function()
	stats.set_int(MPX() .. "H4CNF_BS_GEN", 131071)
	stats.set_int(MPX() .. "H4CNF_BS_ENTR", 63)
	stats.set_int(MPX() .. "H4CNF_BS_ABIL", 63)
	stats.set_int(MPX() .. "H4CNF_WEAPONS", 5)
	stats.set_int(MPX() .. "H4CNF_WEP_DISRP", 3)
	stats.set_int(MPX() .. "H4CNF_ARM_DISRP", 3)
	stats.set_int(MPX() .. "H4CNF_HEL_DISRP", 3)
	stats.set_int(MPX() .. "H4CNF_TARGET", 2)
	stats.set_int(MPX() .. "H4CNF_TROJAN", 2)
	stats.set_int(MPX() .. "H4CNF_APPROACH", -1)
	stats.set_int(MPX() .. "H4LOOT_CASH_I", 0)
	stats.set_int(MPX() .. "H4LOOT_CASH_C", 0)
	stats.set_int(MPX() .. "H4LOOT_WEED_I", 0)
	stats.set_int(MPX() .. "H4LOOT_WEED_C", 0)
	stats.set_int(MPX() .. "H4LOOT_COKE_I", 0)
	stats.set_int(MPX() .. "H4LOOT_COKE_C", 0)
	stats.set_int(MPX() .. "H4LOOT_CASH_I", 0)
	stats.set_int(MPX() .. "H4LOOT_GOLD_I", 0)
	stats.set_int(MPX() .. "H4LOOT_GOLD_C", -1)
	stats.set_int(MPX() .. "H4LOOT_PAINT", 0)
	stats.set_int(MPX() .. "H4_PROGRESS", 131055)
	stats.set_int(MPX() .. "H4LOOT_CASH_I_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_CASH_C_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_WEED_I_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_WEED_C_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_COKE_I_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_COKE_C_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_GOLD_I_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_GOLD_C_SCOPED", -1)
	stats.set_int(MPX() .. "H4LOOT_GOLD_V", 1191817)
	stats.set_int(MPX() .. "H4LOOT_PAINT_SCOPED", 0)
	stats.set_int(MPX() .. "H4_MISSIONS", 65535)
	stats.set_int(MPX() .. "H4_PLAYTHROUGH_STATUS", 32)

	gui.show_message("Cayo Heist", "Bonds Hard Mode has been set up!")
	gui.show_message("Cayo Heist", "Reset the board to see the changes")
end)

CayoHeistEditorMenu:add_sameline()
CayoHeistEditorMenu:add_button("Necklace/Gold (Hard)", function()
	stats.set_int(MPX() .. "H4CNF_BS_GEN", 131071)
	stats.set_int(MPX() .. "H4CNF_BS_ENTR", 63)
	stats.set_int(MPX() .. "H4CNF_BS_ABIL", 63)
	stats.set_int(MPX() .. "H4CNF_WEAPONS", 5)
	stats.set_int(MPX() .. "H4CNF_WEP_DISRP", 3)
	stats.set_int(MPX() .. "H4CNF_ARM_DISRP", 3)
	stats.set_int(MPX() .. "H4CNF_HEL_DISRP", 3)
	stats.set_int(MPX() .. "H4CNF_TARGET", 1)
	stats.set_int(MPX() .. "H4CNF_TROJAN", 2)
	stats.set_int(MPX() .. "H4CNF_APPROACH", -1)
	stats.set_int(MPX() .. "H4LOOT_CASH_I", 0)
	stats.set_int(MPX() .. "H4LOOT_CASH_C", 0)
	stats.set_int(MPX() .. "H4LOOT_WEED_I", 0)
	stats.set_int(MPX() .. "H4LOOT_WEED_C", 0)
	stats.set_int(MPX() .. "H4LOOT_COKE_I", 0)
	stats.set_int(MPX() .. "H4LOOT_COKE_C", 0)
	stats.set_int(MPX() .. "H4LOOT_CASH_I", 0)
	stats.set_int(MPX() .. "H4LOOT_GOLD_I", 0)
	stats.set_int(MPX() .. "H4LOOT_GOLD_C", -1)
	stats.set_int(MPX() .. "H4LOOT_PAINT", 0)
	stats.set_int(MPX() .. "H4_PROGRESS", 131055)
	stats.set_int(MPX() .. "H4LOOT_CASH_I_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_CASH_C_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_WEED_I_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_WEED_C_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_COKE_I_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_COKE_C_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_GOLD_I_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_GOLD_C_SCOPED", -1)
	stats.set_int(MPX() .. "H4LOOT_GOLD_V", 1191817)
	stats.set_int(MPX() .. "H4LOOT_PAINT_SCOPED", 0)
	stats.set_int(MPX() .. "H4_MISSIONS", 65535)
	stats.set_int(MPX() .. "H4_PLAYTHROUGH_STATUS", 32)

	gui.show_message("Cayo Heist", "Necklace Hard Mode has been set up!")
	gui.show_message("Cayo Heist", "Reset the board to see the changes")
end)

CayoHeistEditorMenu:add_sameline()
CayoHeistEditorMenu:add_button("Tequila/Gold (Hard)", function()
	stats.set_int(MPX() .. "H4CNF_BS_GEN", 131071)
	stats.set_int(MPX() .. "H4CNF_BS_ENTR", 63)
	stats.set_int(MPX() .. "H4CNF_BS_ABIL", 63)
	stats.set_int(MPX() .. "H4CNF_WEAPONS", 5)
	stats.set_int(MPX() .. "H4CNF_WEP_DISRP", 3)
	stats.set_int(MPX() .. "H4CNF_ARM_DISRP", 3)
	stats.set_int(MPX() .. "H4CNF_HEL_DISRP", 3)
	stats.set_int(MPX() .. "H4CNF_TARGET", 0)
	stats.set_int(MPX() .. "H4CNF_TROJAN", 2)
	stats.set_int(MPX() .. "H4CNF_APPROACH", -1)
	stats.set_int(MPX() .. "H4LOOT_CASH_I", 0)
	stats.set_int(MPX() .. "H4LOOT_CASH_C", 0)
	stats.set_int(MPX() .. "H4LOOT_WEED_I", 0)
	stats.set_int(MPX() .. "H4LOOT_WEED_C", 0)
	stats.set_int(MPX() .. "H4LOOT_COKE_I", 0)
	stats.set_int(MPX() .. "H4LOOT_COKE_C", 0)
	stats.set_int(MPX() .. "H4LOOT_CASH_I", 0)
	stats.set_int(MPX() .. "H4LOOT_GOLD_I", 0)
	stats.set_int(MPX() .. "H4LOOT_GOLD_C", -1)
	stats.set_int(MPX() .. "H4LOOT_PAINT", 0)
	stats.set_int(MPX() .. "H4_PROGRESS", 131055)
	stats.set_int(MPX() .. "H4LOOT_CASH_I_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_CASH_C_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_WEED_I_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_WEED_C_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_COKE_I_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_COKE_C_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_GOLD_I_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_GOLD_C_SCOPED", -1)
	stats.set_int(MPX() .. "H4LOOT_GOLD_V", 1191817)
	stats.set_int(MPX() .. "H4LOOT_PAINT_SCOPED", 0)
	stats.set_int(MPX() .. "H4_MISSIONS", 65535)
	stats.set_int(MPX() .. "H4_PLAYTHROUGH_STATUS", 32)

	gui.show_message("Cayo Heist", "Tequila Hard Mode has been set up!")
	gui.show_message("Cayo Heist", "Reset the board to see the changes")
end)
CayoHeistEditorMenu:add_separator()
CayoHeistEditorMenu:add_text("Legit Presets")

CayoHeistEditorMenu:add_button("Panther/Gold (L. Hard)", function()
	stats.set_int(MPX() .. "H4CNF_BS_GEN", 131071)
	stats.set_int(MPX() .. "H4CNF_BS_ENTR", 63)
	stats.set_int(MPX() .. "H4CNF_BS_ABIL", 63)
	stats.set_int(MPX() .. "H4CNF_WEAPONS", 5)
	stats.set_int(MPX() .. "H4CNF_WEP_DISRP", 3)
	stats.set_int(MPX() .. "H4CNF_ARM_DISRP", 3)
	stats.set_int(MPX() .. "H4CNF_HEL_DISRP", 3)
	stats.set_int(MPX() .. "H4CNF_TARGET", 5) --Primary Target Values: 0. Tequila, 1. Necklace, 2. Bonds, 3. Diamond, 4. Medrazo Files, 5. Panther
	stats.set_int(MPX() .. "H4CNF_TROJAN", 2)
	stats.set_int(MPX() .. "H4CNF_APPROACH", -1)
	-- Island Loot // -1 shows all, 0 shows none
	stats.set_int(MPX() .. "H4LOOT_CASH_I", 0)
	stats.set_int(MPX() .. "H4LOOT_WEED_I", 0)
	stats.set_int(MPX() .. "H4LOOT_COKE_I", 0)
	stats.set_int(MPX() .. "H4LOOT_GOLD_I", 0)

	-- Compound Loot // -1 shows all, 0 shows none
	stats.set_int(MPX() .. "H4LOOT_CASH_C", 0)
	stats.set_int(MPX() .. "H4LOOT_WEED_C", 0)
	stats.set_int(MPX() .. "H4LOOT_COKE_C", 0)
	stats.set_int(MPX() .. "H4LOOT_GOLD_C", -1)
	stats.set_int(MPX() .. "H4LOOT_PAINT", 0)
	stats.set_int(MPX() .. "H4_PROGRESS", 131055) -- 131055 // Hard Mode  -  130667 // Solo Normal??

	-- These are what is set when you find loot throughout the island/compound
	stats.set_int(MPX() .. "H4LOOT_CASH_I_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_CASH_C_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_WEED_I_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_WEED_C_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_COKE_I_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_COKE_C_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_GOLD_I_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_GOLD_C_SCOPED", -1)
	stats.set_int(MPX() .. "H4LOOT_PAINT_SCOPED", 0)

	-- Payout Values // Set to "Normal" values.  Each value is multiplied by 8, bc there are 8 locations for them.
	stats.set_int(MPX() .. "H4LOOT_GOLD_V", 45375)
	globals.set_int(PSV, 1900000) -- Panther Value -- 1900000 shows as 2,090,000 in-game on the board. 190,000 difference.

	stats.set_int(MPX() .. "H4_MISSIONS", 65535)
	stats.set_int(MPX() .. "H4_PLAYTHROUGH_STATUS", 32)

	gui.show_message("Cayo Heist", "Panther Hard Mode (Legit) has been set up!")
	gui.show_message("Cayo Heist", "Reset the board to see the changes")
end)

CayoHeistEditorMenu:add_sameline()

CayoHeistEditorMenu:add_button("Diamond/Gold (L. Hard)", function()
	stats.set_int(MPX() .. "H4CNF_BS_GEN", 131071)
	stats.set_int(MPX() .. "H4CNF_BS_ENTR", 63)
	stats.set_int(MPX() .. "H4CNF_BS_ABIL", 63)
	stats.set_int(MPX() .. "H4CNF_WEAPONS", 5)
	stats.set_int(MPX() .. "H4CNF_WEP_DISRP", 3)
	stats.set_int(MPX() .. "H4CNF_ARM_DISRP", 3)
	stats.set_int(MPX() .. "H4CNF_HEL_DISRP", 3)
	stats.set_int(MPX() .. "H4CNF_TARGET", 3) --Primary Target Values: 0. Tequila, 1. Necklace, 2. Bonds, 3. Diamond, 4. Medrazo Files, 5. Panther
	stats.set_int(MPX() .. "H4CNF_TROJAN", 2)
	stats.set_int(MPX() .. "H4CNF_APPROACH", -1)
	-- Island Loot // -1 shows all, 0 shows none
	stats.set_int(MPX() .. "H4LOOT_CASH_I", 0)
	stats.set_int(MPX() .. "H4LOOT_WEED_I", 0)
	stats.set_int(MPX() .. "H4LOOT_COKE_I", 0)
	stats.set_int(MPX() .. "H4LOOT_GOLD_I", 0)

	-- Compound Loot // -1 shows all, 0 shows none
	stats.set_int(MPX() .. "H4LOOT_CASH_C", 0)
	stats.set_int(MPX() .. "H4LOOT_WEED_C", 0)
	stats.set_int(MPX() .. "H4LOOT_COKE_C", 0)
	stats.set_int(MPX() .. "H4LOOT_GOLD_C", -1)
	stats.set_int(MPX() .. "H4LOOT_PAINT", 0)
	stats.set_int(MPX() .. "H4_PROGRESS", 131055) -- 131055 // Hard Mode  -  130667 // Solo Normal??

	-- These are what is set when you find loot throughout the island/compound
	stats.set_int(MPX() .. "H4LOOT_CASH_I_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_CASH_C_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_WEED_I_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_WEED_C_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_COKE_I_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_COKE_C_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_GOLD_I_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_GOLD_C_SCOPED", -1)
	stats.set_int(MPX() .. "H4LOOT_PAINT_SCOPED", 0)

	-- Payout Values // Set to "Normal" values.  Each value is multiplied by 8, bc there are 8 locations for them.
	stats.set_int(MPX() .. "H4LOOT_GOLD_V", 45375)
	globals.set_int(PDIAMOND, 1300000) -- Diamond Value  -- 1300000 shows as 1,430,000 in-game. 130,000 difference.

	stats.set_int(MPX() .. "H4_MISSIONS", 65535)
	stats.set_int(MPX() .. "H4_PLAYTHROUGH_STATUS", 32)

	gui.show_message("Cayo Heist", "Diamond Hard Mode (Legit) has been set up!")
	gui.show_message("Cayo Heist", "Reset the board to see the changes")
end)

CayoHeistEditorMenu:add_sameline()

CayoHeistEditorMenu:add_button("Bonds/Gold (L. Hard)", function()
	stats.set_int(MPX() .. "H4CNF_BS_GEN", 131071)
	stats.set_int(MPX() .. "H4CNF_BS_ENTR", 63)
	stats.set_int(MPX() .. "H4CNF_BS_ABIL", 63)
	stats.set_int(MPX() .. "H4CNF_WEAPONS", 5)
	stats.set_int(MPX() .. "H4CNF_WEP_DISRP", 3)
	stats.set_int(MPX() .. "H4CNF_ARM_DISRP", 3)
	stats.set_int(MPX() .. "H4CNF_HEL_DISRP", 3)
	stats.set_int(MPX() .. "H4CNF_TARGET", 2) --Primary Target Values: 0. Tequila, 1. Necklace, 2. Bonds, 3. Diamond, 4. Medrazo Files, 5. Panther
	stats.set_int(MPX() .. "H4CNF_TROJAN", 2)
	stats.set_int(MPX() .. "H4CNF_APPROACH", -1)
	-- Island Loot // -1 shows all, 0 shows none
	stats.set_int(MPX() .. "H4LOOT_CASH_I", 0)
	stats.set_int(MPX() .. "H4LOOT_WEED_I", 0)
	stats.set_int(MPX() .. "H4LOOT_COKE_I", 0)
	stats.set_int(MPX() .. "H4LOOT_GOLD_I", 0)

	-- Compound Loot // -1 shows all, 0 shows none
	stats.set_int(MPX() .. "H4LOOT_CASH_C", 0)
	stats.set_int(MPX() .. "H4LOOT_WEED_C", 0)
	stats.set_int(MPX() .. "H4LOOT_COKE_C", 0)
	stats.set_int(MPX() .. "H4LOOT_GOLD_C", -1)
	stats.set_int(MPX() .. "H4LOOT_PAINT", 0)
	stats.set_int(MPX() .. "H4_PROGRESS", 131055) -- 131055 // Hard Mode  -  130667 // Solo Normal??

	-- These are what is set when you find loot throughout the island/compound
	stats.set_int(MPX() .. "H4LOOT_CASH_I_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_CASH_C_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_WEED_I_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_WEED_C_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_COKE_I_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_COKE_C_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_GOLD_I_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_GOLD_C_SCOPED", -1)
	stats.set_int(MPX() .. "H4LOOT_PAINT_SCOPED", 0)

	-- Payout Values // Set to "Normal" values.  Each value is multiplied by 8, bc there are 8 locations for them.
	stats.set_int(MPX() .. "H4LOOT_GOLD_V", 45375)
	globals.set_int(BB, 770000) -- Bonds Value -- 770000 shows as 847,000 in-game.  77,000 difference.

	stats.set_int(MPX() .. "H4_MISSIONS", 65535)
	stats.set_int(MPX() .. "H4_PLAYTHROUGH_STATUS", 32)

	gui.show_message("Cayo Heist", "Bonds Hard Mode (Legit) has been set up!")
	gui.show_message("Cayo Heist", "Reset the board to see the changes")
end)

CayoHeistEditorMenu:add_sameline()

CayoHeistEditorMenu:add_button("Necklace/Gold (L. Hard)", function()
	stats.set_int(MPX() .. "H4CNF_BS_GEN", 131071)
	stats.set_int(MPX() .. "H4CNF_BS_ENTR", 63)
	stats.set_int(MPX() .. "H4CNF_BS_ABIL", 63)
	stats.set_int(MPX() .. "H4CNF_WEAPONS", 5)
	stats.set_int(MPX() .. "H4CNF_WEP_DISRP", 3)
	stats.set_int(MPX() .. "H4CNF_ARM_DISRP", 3)
	stats.set_int(MPX() .. "H4CNF_HEL_DISRP", 3)
	stats.set_int(MPX() .. "H4CNF_TARGET", 1) --Primary Target Values: 0. Tequila, 1. Necklace, 2. Bonds, 3. Diamond, 4. Medrazo Files, 5. Panther
	stats.set_int(MPX() .. "H4CNF_TROJAN", 2)
	stats.set_int(MPX() .. "H4CNF_APPROACH", -1)
	-- Island Loot // -1 shows all, 0 shows none
	stats.set_int(MPX() .. "H4LOOT_CASH_I", 0)
	stats.set_int(MPX() .. "H4LOOT_WEED_I", 0)
	stats.set_int(MPX() .. "H4LOOT_COKE_I", 0)
	stats.set_int(MPX() .. "H4LOOT_GOLD_I", 0)

	-- Compound Loot // -1 shows all, 0 shows none
	stats.set_int(MPX() .. "H4LOOT_CASH_C", 0)
	stats.set_int(MPX() .. "H4LOOT_WEED_C", 0)
	stats.set_int(MPX() .. "H4LOOT_COKE_C", 0)
	stats.set_int(MPX() .. "H4LOOT_GOLD_C", -1)
	stats.set_int(MPX() .. "H4LOOT_PAINT", 0)
	stats.set_int(MPX() .. "H4_PROGRESS", 131055) -- 131055 // Hard Mode  -  130667 // Solo Normal??

	-- These are what is set when you find loot throughout the island/compound
	stats.set_int(MPX() .. "H4LOOT_CASH_I_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_CASH_C_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_WEED_I_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_WEED_C_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_COKE_I_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_COKE_C_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_GOLD_I_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_GOLD_C_SCOPED", -1)
	stats.set_int(MPX() .. "H4LOOT_PAINT_SCOPED", 0)

	-- Payout Values // Set to "Normal" values.  Each value is multiplied by 8, bc there are 8 locations for them.
	stats.set_int(MPX() .. "H4LOOT_GOLD_V", 45375)
	globals.set_int(RN, 700000) -- Necklace Value -- 700000 shows as 770,000 in-game. 70,000 difference.

	stats.set_int(MPX() .. "H4_MISSIONS", 65535)
	stats.set_int(MPX() .. "H4_PLAYTHROUGH_STATUS", 32)

	gui.show_message("Cayo Heist", "Necklace Hard Mode (Legit) has been set up!")
	gui.show_message("Cayo Heist", "Reset the board to see the changes")
end)

CayoHeistEditorMenu:add_sameline()

CayoHeistEditorMenu:add_button("Tequila/Gold (L. Hard)", function()
	stats.set_int(MPX() .. "H4CNF_BS_GEN", 131071)
	stats.set_int(MPX() .. "H4CNF_BS_ENTR", 63)
	stats.set_int(MPX() .. "H4CNF_BS_ABIL", 63)
	stats.set_int(MPX() .. "H4CNF_WEAPONS", 5)
	stats.set_int(MPX() .. "H4CNF_WEP_DISRP", 3)
	stats.set_int(MPX() .. "H4CNF_ARM_DISRP", 3)
	stats.set_int(MPX() .. "H4CNF_HEL_DISRP", 3)
	stats.set_int(MPX() .. "H4CNF_TARGET", 0) --Primary Target Values: 0. Tequila, 1. Necklace, 2. Bonds, 3. Diamond, 4. Medrazo Files, 5. Panther
	stats.set_int(MPX() .. "H4CNF_TROJAN", 2)
	stats.set_int(MPX() .. "H4CNF_APPROACH", -1)
	-- Island Loot // -1 shows all, 0 shows none
	stats.set_int(MPX() .. "H4LOOT_CASH_I", 0)
	stats.set_int(MPX() .. "H4LOOT_WEED_I", 0)
	stats.set_int(MPX() .. "H4LOOT_COKE_I", 0)
	stats.set_int(MPX() .. "H4LOOT_GOLD_I", 0)

	-- Compound Loot // -1 shows all, 0 shows none
	stats.set_int(MPX() .. "H4LOOT_CASH_C", 0)
	stats.set_int(MPX() .. "H4LOOT_WEED_C", 0)
	stats.set_int(MPX() .. "H4LOOT_COKE_C", 0)
	stats.set_int(MPX() .. "H4LOOT_GOLD_C", -1)
	stats.set_int(MPX() .. "H4LOOT_PAINT", 0)
	stats.set_int(MPX() .. "H4_PROGRESS", 131055) -- 131055 // Hard Mode  -  130667 // Solo Normal??

	-- These are what is set when you find loot throughout the island/compound
	stats.set_int(MPX() .. "H4LOOT_CASH_I_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_CASH_C_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_WEED_I_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_WEED_C_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_COKE_I_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_COKE_C_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_GOLD_I_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_GOLD_C_SCOPED", -1)
	stats.set_int(MPX() .. "H4LOOT_PAINT_SCOPED", 0)

	-- Payout Values // Set to "Normal" values.  Each value is multiplied by 8, bc there are 8 locations for them.
	stats.set_int(MPX() .. "H4LOOT_GOLD_V", 45375)
	globals.set_int(TEQUILA, 693000) -- Tequila Value -- 630000 shows as 693,000. 63,000 difference.

	stats.set_int(MPX() .. "H4_MISSIONS", 65535)
	stats.set_int(MPX() .. "H4_PLAYTHROUGH_STATUS", 32)

	gui.show_message("Cayo Heist", "Tequila Hard Mode (Legit) has been set up!")
	gui.show_message("Cayo Heist", "Reset the board to see the changes")
end)

CayoHeistEditorMenu:add_separator()
CayoHeistEditorMenu:add_text("Reset Presets Completely")
CayoHeistEditorMenu:add_button("Reset Heist Completely", function()
	stats.set_int(MPX() .. "H4_MISSIONS", 0)
	stats.set_int(MPX() .. "H4_PROGRESS", 0)
	stats.set_int(MPX() .. "H4_PLAYTHROUGH_STATUS", 0)
	stats.set_int(MPX() .. "H4CNF_APPROACH", 0)
	stats.set_int(MPX() .. "H4CNF_BS_ENTR", 0)
	stats.set_int(MPX() .. "H4CNF_BS_GEN", 0)
end)

CayoHeistEditorMenu:add_separator()
CayoHeistEditorMenu:add_text(
	"Press this after clicking one of the above presets or after the reset heist Completely Option"
)
CayoHeistEditorMenu:add_button("Reset Kosatka Board", function()
	locals.set_int(HIP, CPRSl, 2)
	gui.show_message("Cayo Heist", "Planning board has been reset!")
end)

CayoHeistEditorMenu:add_separator()
CayoHeistEditorMenu:add_text("During Heist")
CayoHeistEditorMenu:add_button("Skip Drainage Cut", function()
	locals.set_int(FMC2020, CPSTCl, 6)
	gui.show_message("Cayo Heist", "Bypassed Drainage Cut")
end)

CayoHeistEditorMenu:add_sameline()
CayoHeistEditorMenu:add_button("Skip Fingerprint Scanner", function()
	locals.set_int(FMC2020, CPFHl, 5)
	gui.show_message("Cayo Heist", "Bypassed Fingerprint Scanner")
end)

CayoHeistEditorMenu:add_sameline()
CayoHeistEditorMenu:add_button("Skip Glass Cut", function()
	locals.set_float(FMC2020, CPPCCl, 100.0)
	gui.show_message("Cayo Heist", "Bypassed Plasma Cutter")
end)

CayoHeistEditorMenu:add_sameline()
CayoHeistEditorMenu:add_button("Remove All CCTV's", function()
	for _, ent in pairs(entities.get_all_objects_as_handles()) do
		for __, cam in pairs(CamList) do
			if ENTITY.GET_ENTITY_MODEL(ent) == cam then
				ENTITY.SET_ENTITY_AS_MISSION_ENTITY(ent, true, true)
				ENTITY.DELETE_ENTITY(ent)
			end
		end
	end
end)
CamList = {
	joaat("prop_cctv_cam_01a"),
	joaat("prop_cctv_cam_01b"),
	joaat("prop_cctv_cam_02a"),
	joaat("prop_cctv_cam_03a"),
	joaat("prop_cctv_cam_04a"),
	joaat("prop_cctv_cam_04c"),
	joaat("prop_cctv_cam_05a"),
	joaat("prop_cctv_cam_06a"),
	joaat("prop_cctv_cam_07a"),
	joaat("prop_cs_cctv"),
	joaat("p_cctv_s"),
	joaat("hei_prop_bank_cctv_01"),
	joaat("hei_prop_bank_cctv_02"),
	joaat("ch_prop_ch_cctv_cam_02a"),
	joaat("xm_prop_x17_server_farm_cctv_01"),
}

CayoHeistEditorMenu:add_sameline()
CayoHeistEditorMenu:add_button("Delete Mission NPC's", function() -- Thanks to RazorGamerX for the help on this
	for index, ped in ipairs(entities.get_all_peds_as_handles()) do
		local model = ENTITY.GET_ENTITY_MODEL(ped)
		if model == 0x7ED5AD78 or model == 0x6C8C08E5 or model == 0x995B3F9F or model == 0xB881AEE then
			ENTITY.SET_ENTITY_AS_MISSION_ENTITY(ped, true, true)
			PED.DELETE_PED(ped)
		end
	end
end)

CayoHeistEditorMenu:add_separator()
CayoHeistEditorMenu:add_text("After Heist")
CayoHeistEditorMenu:add_button("Skip Cooldown", function()
	-- Solo Skip
	stats.set_int("MP0_H4_TARGET_POSIX", 1659643454)
	stats.set_int("MP0_H4_COOLDOWN", 0)
	stats.set_int("MP0_H4_COOLDOWN_HARD", 0)
	-- Multiplayer Skip
	stats.set_int("MP0_H4_TARGET_POSIX", 1659429119)
	stats.set_int("MP0_H4_COOLDOWN", 0)
	stats.set_int("MP0_H4_COOLDOWN_HARD", 0)
	-- Solo Skip (Second Character)
	stats.set_int("MP1_H4_TARGET_POSIX", 1659643454)
	stats.set_int("MP1_H4_COOLDOWN", 0)
	stats.set_int("MP1_H4_COOLDOWN_HARD", 0)
	-- Multiplayer Skip (Second Character)
	stats.set_int("MP1_H4_TARGET_POSIX", 1659429119)
	stats.set_int("MP1_H4_COOLDOWN", 0)
	stats.set_int("MP1_H4_COOLDOWN_HARD", 0)

	gui.show_message("Cayo Heist", "Skipped Cayo Perico Cooldown for all characters")
	gui.show_message("Cayo Heist", "Go to story mode and come back to apply the reset")
end)
CayoHeistEditorMenu:add_separator()
CayoHeistEditorMenu:add_text("How to Set Up or Bypass Cooldown:")
CayoHeistEditorMenu:add_text(
	"Make sure you have completed the heist and you are standing in front of the planning screen"
)
CayoHeistEditorMenu:add_text("Click Skip Cooldown, then click on your Preset and click Reset Kosatka Board")

CayoHeistEditorMenu:add_separator()
CayoHeistEditorMenu:add_text("Instant Heist Passed")
CayoHeistEditorMenu:add_button("Instant Finish $$", function()
	locals.set_int(FMC2020, IHPB, 9)
	locals.set_int(FMC2020, IHPL, 50)
	gui.show_message("Instant Heist Passed", "Activated")
end)

-- Cayo Bag Size & Value Editor
local cayoSizeEditor = CayoHeistEditorMenu:add_tab("Size/Value Editor")
cayoSizeEditor:add_text("Bag Size Editor")
bagSizeVal = 1800
cayoSizeEditor:add_imgui(function()
	bagSizeVal, used = ImGui.SliderInt("Bag Size", bagSizeVal, 1800, 7200) -- 7200 = 4 players, this works if you want more money solo and it adjusts so you can always have full bags
	if used then
		globals.set_int(BAS1, bagSizeVal)
		gui.show_message("Bag Size Modified!")
	end
end)

cayoSizeEditor:add_text("Custom Bag Size Editor")
custombagSizeVal = 1800
cayoSizeEditor:add_imgui(function()
	custombagSizeVal, used = ImGui.SliderInt("Custom Bag Size", custombagSizeVal, 1800, 2147483646)
	if used then
		globals.set_int(BAS1, custombagSizeVal)
		gui.show_message("Custom Bag Size Modified!")
	end
end)

cayoSizeEditor:add_separator()
cayoSizeEditor:add_text("Primary Target Editors")
pantherSizeVal = 1900000
cayoSizeEditor:add_imgui(function()
	pantherSizeVal, used = ImGui.SliderInt("Panther Value", pantherSizeVal, 1900000, 3800000) -- Double the original price
	out = "Reset the board to see changes"

	if used then
		globals.set_int(PSV, pantherSizeVal)
		gui.show_message("Panther Value Modified!", out)
	end
end)

diamondSizeVal = 1300000
cayoSizeEditor:add_imgui(function()
	diamondSizeVal, used = ImGui.SliderInt("Diamond Value", diamondSizeVal, 1300000, 2600000) -- Double the original price
	out = "Reset the board to see changes"

	if used then
		globals.set_int(PDIAMOND, diamondSizeVal)
		gui.show_message("Diamond Value Modified!", out)
	end
end)

bondSizeVal = 770000
cayoSizeEditor:add_imgui(function()
	bondSizeVal, used = ImGui.SliderInt("Bonds Value", bondSizeVal, 770000, 1540000) -- Double the original price
	out = "Reset the board to see changes"

	if used then
		globals.set_int(BB, bondSizeVal)
		gui.show_message("Bonds Value Modified!", out)
	end
end)

necklaceSizeVal = 700000
cayoSizeEditor:add_imgui(function()
	necklaceSizeVal, used = ImGui.SliderInt("Necklace Value", necklaceSizeVal, 700000, 1400000) -- Double the original price
	out = "Reset the board to see changes"

	if used then
		globals.set_int(RN, necklaceSizeVal)
		gui.show_message("Necklace Value Modified!", out)
	end
end)

tequilaSizeVal = 693000
cayoSizeEditor:add_imgui(function()
	tequilaSizeVal, used = ImGui.SliderInt("Tequila Value", tequilaSizeVal, 693000, 1400000) -- Double the original price
	out = "Reset the board to see changes"

	if used then
		globals.set_int(TEQUILA, tequilaSizeVal)
		gui.show_message("Tequila Value Modified!", out)
	end
end)

cayoSizeEditor:add_separator()
cayoSizeEditor:add_text("Secondary Target Editors")

goldSizeVal = 45375
cayoSizeEditor:add_imgui(function()
	goldSizeVal, used = ImGui.SliderInt("Gold Value", goldSizeVal, 45375, 181500) -- Quadruple the original price
	out = "Reset the board to see changes"

	if used then
		stats.set_int(MPX() .. "H4LOOT_GOLD_V", goldSizeVal)
		gui.show_message("Gold Value Modified!", out)
	end
end)

cokeSizeVal = 25312
cayoSizeEditor:add_imgui(function()
	cokeSizeVal, used = ImGui.SliderInt("Coke Value", cokeSizeVal, 25312, 101248) -- Quadruple the original price
	out = "Reset the board to see changes"

	if used then
		stats.set_int(MPX() .. "H4LOOT_COKE_V", cokeSizeVal)
		gui.show_message("Coke Value Modified!", out)
	end
end)

paintSizeVal = 22500
cayoSizeEditor:add_imgui(function()
	paintSizeVal, used = ImGui.SliderInt("Paintings Value", paintSizeVal, 22500, 90000) -- Quadruple the original price
	out = "Reset the board to see changes"

	if used then
		stats.set_int(MPX() .. "H4LOOT_PAINT_V", paintSizeVal)
		gui.show_message("Paintings Value Modified!", out)
	end
end)

weedSizeVal = 16875
cayoSizeEditor:add_imgui(function()
	weedSizeVal, used = ImGui.SliderInt("Weed Value", weedSizeVal, 16875, 67500) -- Quadruple the original price
	out = "Reset the board to see changes"

	if used then
		stats.set_int(MPX() .. "H4LOOT_WEED_V", weedSizeVal)
		gui.show_message("Weed Value Modified!", out)
	end
end)

cashSizeVal = 10406
cayoSizeEditor:add_imgui(function()
	cashSizeVal, used = ImGui.SliderInt("Cash Value", cashSizeVal, 10406, 41624) -- Quadruple the original price
	out = "Reset the board to see changes"

	if used then
		stats.set_int(MPX() .. "H4LOOT_WEED_V", cashSizeVal)
		gui.show_message("Cash Value Modified!", out)
	end
end)
cayoSizeEditor:add_text("These values seem incorrect, but the game reads them properly.")
cayoSizeEditor:add_text("Minimum values are exact defaults for ALL targets.")
cayoSizeEditor:add_separator()
cayoSizeEditor:add_text("Press this after setting values.")
cayoSizeEditor:add_button("Reset Kosatka Board", function()
	locals.set_int(HIP, 1566, 2)
	gui.show_message("Cayo Heist", "Planning board has been reset!")
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

DoomsdayHeistEditorMenu = HeistsDataEditorMenu:add_tab("Doomsday Heist Editor")

DoomsdayHeistEditorMenu:add_button("One Click Setup Act 1: The Data Breaches", function()
	stats.set_int(MPX() .. "GANGOPS_FLOW_MISSION_PROG", 7)
	stats.set_int(MPX() .. "GANGOPS_FM_MISSION_PROG", 7)
end)

DoomsdayHeistEditorMenu:add_button("One Click Setup Act 2: The Bodgan Problem", function()
	stats.set_int(MPX() .. "GANGOPS_FLOW_MISSION_PROG", 240)
	stats.set_int(MPX() .. "GANGOPS_FM_MISSION_PROG", 248)
end)

DoomsdayHeistEditorMenu:add_button("One Click Setup Act 3: Doomsday Scenario", function()
	stats.set_int(MPX() .. "GANGOPS_FLOW_MISSION_PROG", 15872)
	stats.set_int(MPX() .. "GANGOPS_FM_MISSION_PROG", 16128)
end)

DoomsdayHeistEditorMenu:add_text("Set Doomsday Heist Cuts")
DoomsdayHeistEditorMenu:add_text("Preset Cut")
DoomsdayHeistEditorMenu:add_button("100", function()
	CutsPresetter(DCg1, DCg4, 100)
end)
DoomsdayHeistEditorMenu:add_text("Custom Cuts")
local dmsdyCut1 = DoomsdayHeistEditorMenu:add_input_int("Cut 1")
local dmsdyCut2 = DoomsdayHeistEditorMenu:add_input_int("Cut 2")
local dmsdyCut3 = DoomsdayHeistEditorMenu:add_input_int("Cut 3")
local dmsdyCut4 = DoomsdayHeistEditorMenu:add_input_int("Cut 4")
DoomsdayHeistEditorMenu:add_button("Set Cuts", function()
	globals.set_int(DCg1, dmsdyCut1:get_value())
	globals.set_int(DCg2, dmsdyCut2:get_value())
	globals.set_int(DCg3, dmsdyCut3:get_value())
	globals.set_int(DCg4, dmsdyCut4:get_value())
end)

DoomsdayHeistEditorMenu:add_separator()
DoomsdayHeistEditorMenu:add_text("Preps")
DoomsdayHeistEditorMenu:add_button("Reset Preps", function()
	DoomsdayActSetter(240, 0)
end)

DoomsdayHeistEditorMenu:add_sameline()
DoomsdayHeistEditorMenu:add_button("Complete Preps", function()
	stats.set_int(MPX() .. "GANGOPS_FM_MISSION_PROG", -1)
end)

DoomsdayHeistEditorMenu:add_separator()
DoomsdayHeistEditorMenu:add_text("Bypass Doomsday Scenario hack")
DoomsdayHeistEditorMenu:add_button("By Act III Pass hack", function()
	locals.set_int(FMC, DDSHl, 3)
end)

DoomsdayHeistEditorMenu:add_separator()
DoomsdayHeistEditorMenu:add_text("Instant Heist Passed")
DoomsdayHeistEditorMenu:add_button("Instant Finish $$", function()
	locals.set_int(FMC, 19787, 12)
	locals.set_int(FMC, 19787 + 2686, 10000000)
	locals.set_int(FMC, 29011 + 1, 99999)
	locals.set_int(FMC, 31663 + 69, 99999)
	gui.show_message("Instant Heist Passed", "Activated")
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


