-- Define MPX as a function that returns the appropriate prefix string
local function MPX()
    return "MP" .. stats.get_int("MPPLY_LAST_MP_CHAR") .. "_"
end
-- Global Variables

-- Free Mode Global Variables
FMg = 262145 -- free mode global ("CASH_MULTIPLIER")
APg = FMg + 31084 -- agency payout global ("FIXER_FINALE_LEADER_CASH_REWARD")
XMg = FMg + 1 -- xp multiplier global ("XP_MULTIPLIER")
CSg1    = 1575035 						-- change session (type) 1 					// Guide:   NETWORK::UGC_SET_USING_OFFLINE_CONTENT(false);
CSg2    = 1574589 						-- change session (switch) 2 				// Guide:   MP_POST_MATCH_TRANSITION_SCENE
CSg3    = 1574589 + 2 					-- change session (quit) 3 					// Guide:   MP_POST_MATCH_TRANSITION_SCENE
-- Auto Shop variables
ASIFl1 = 50150 + 1 -- auto shop instant finish local 1 
ASIFl2 = 50150 + 1770 + 1 -- auto shop finish local 2 
ASRBl = 383 -- auto shop reload board local 
ASPg1 = FMg + 30338 + 1 -- auto shop payout global 1 ("TUNER_ROBBERY_LEADER_CASH_REWARD0")
ASPg2 = FMg + 30338 + 8 -- auto shop payout global 2 ("TUNER_ROBBERY_LEADER_CASH_REWARD7")
ASFg = FMg + 30334 -- auto shop fee global ("TUNER_ROBBERY_CONTACT_FEE")
ASCKg = FMg + 30357 -- auto shop cooldown global ("TUNER_ROBBERY_COOLDOWN_TIME")


-- Doomsday Heist Variables
DDSHl = 1271 + 135 -- doomsday doomsday scenario hack local
DCg1 = 1960755 + 812 + 50 + 1 -- doomsday player 1 cut global
DCg2 = 1960755 + 812 + 50 + 2 -- doomsday player 2 cut global
DCg3 = 1960755 + 812 + 50 + 3 -- doomsday player 3 cut global
DCg4 = 1960755 + 812 + 50 + 4 -- doomsday player 4 cut global
GCg = 2685249 + 6615 -- global cut global (value2 = value2 * (num / 100f);)

-- Cayo Perico Heist Variables
CPRSl = 1546 -- cayo perico reload screen local 
CPCg1 = 1971648 + 831 + 56 + 1 -- cayo perico player 1 cut global
CPCg2 = 1971648 + 831 + 56 + 2 -- cayo perico player 2 cut global
CPCg3 = 1971648 + 831 + 56 + 3 -- cayo perico player 3 cut global
CPCg4 = 1971648 + 831 + 56 + 4 -- cayo perico player 4 cut global
CPBg = FMg + 29211
CPFHl = 24880  -- cayo perico fingerprint hack local 
CPPCCl = 30939 + 3 -- cayo perico plasma cutter cut local ("DLC_H4_anims_glass_cutter_Sounds") 
CPSTCl = 29700 -- cayo perico drainage pipe cut local

-- Apartment Heist Variables
ACg1 = 1928958 + 1 + 1 -- global apartment player 1 cut global
ACg2 = 1928958 + 1 + 2 -- global apartment player 2 cut global
ACg3 = 1928958 + 1 + 3 -- global apartment player 3 cut global
ACg4 = 1928958 + 1 + 4 -- global apartment player 4 cut global
ACg5 = 1930926 + 3008 + 1 -- local apartment player 1 cut global
AUAJg1 = FMg + 9101 -- apartment unlock all jobs global 1 ("ROOT_ID_HASH_THE_FLECCA_JOB")
AUAJg2 = FMg + 9106 -- apartment unlock all jobs global 2 ("ROOT_ID_HASH_THE_PRISON_BREAK")
AUAJg3 = FMg + 9113 -- apartment unlock all jobs global 3 ("ROOT_ID_HASH_THE_HUMANE_LABS_RAID")
AUAJg4 = FMg + 9119 -- apartment unlock all jobs global 4 ("ROOT_ID_HASH_SERIES_A_FUNDING")
AUAJg5 = FMg + 9125 -- apartment unlock all jobs global 5 ("ROOT_ID_HASH_THE_PACIFIC_STANDARD_JOB")
AIFl3 = 19746 -- apartment instant finish local 1
AIFl4 = 28365 + 1 -- apartment instant finish local 2
AIFl5 = 31621 + 69 -- apartment instant finish local 3
AFHl = 11778 + 24 -- apartment fleeca hack local 
AFDl = 10069 + 11 -- apartment fleeca drill local

-- Diamond Casino Heist Variables
DCRBl = 185 -- diamond casino reload board local
DCCg1 = 1964849 + 1497 + 736 + 92 + 1 -- diamond casino player 1 cut global
DCCg2 = 1964849 + 1497 + 736 + 92 + 2 -- diamond casino player 2 cut global
DCCg3 = 1964849 + 1497 + 736 + 92 + 3 -- diamond casino player 3 cut global
DCCg4 = 1964849 + 1497 + 736 + 92 + 4 -- diamond casino player 4 cut global
DCCl = FMg +28313  -- Casino_Cut_Lester_offset
DCCh = FMg+28349-1 --Casino_Cut_Hacker_offset
DCCd = FMg+28344-1 --Casino_Cut_Driver_offset
DCCgun = FMg + 28339-1 --Casino_Cut_Gunman_offset
DCFHl = 53019      -- diamond casino fingerprint hack local
DCKHl = 54085      -- diamond casino keypad hack local
DCDVDl1 = 10109 + 7 -- diamond casino drill vault door local 1
DCDVDl2 = 10109 + 37 -- diamond casino drill vault door local 2

-- Bunker Variables
BUCg1 = FMg + 21018 -- bunker unlocker cooldown global 1 (946764522)
BUCg2 = FMg + 21264 -- bunker unlocker cooldown global 2 ("GR_RESEARCH_CAPACITY")
BUCg3 = FMg + 21265 -- bunker unlocker cooldown global 3 ("GR_RESEARCH_PRODUCTION_TIME")
BUCg4 = FMg + 21266 -- bunker unlocker cooldown global 4 ("GR_RESEARCH_UPGRADE_EQUIPMENT_REDUCTION_TIME")
BUAg1 = FMg + 21268 -- bunker unlocker additional global 1 (1485279815)
BUAg2 = FMg + 21269 -- bunker unlocker additional global 2 (2041812011)
GSIg = 1663174 		-- get supplies instantly global ("OR_PSUP_DEL)
BCISl = 1211 + 774 	-- bunker crash instant sell local
BCFp1 = FMg + 32359 -- bunker fast production (ENABLE_CONTROL_SUPPLY_GUNRUNNINGBUNKER_CARGO)
BCFp2 = FMg + 21249 -- bunker fast production (GR_MANU_PRODUCTION_TIME)
BCFp3 = FMg + 32366 -- bunker fast production (SPEED_SUPPLY_GUNRUNNINGBUNKER_CARGO)


-- Hangar Variables
HCVPg = FMg + 22492 -- hangar cargo vip payout global (-954321460)
HCVRCg = FMg + 22475 -- hangar cargo vip ron's cut (1232447926)
HCVISl1 = 1934 + 1078 -- hangar cargo vip instant sell local 1
HCVISl2 = 1934 + 768 -- hangar cargo vip instant sell local 2

-- Nightclub Variables
NHCNSg = FMg + 23969 -- nightclub helper cargo n shipments global (1162393585)
NHSGg = FMg + 23963 -- nightclub helper sporting goods global (-1523050891)
NHSAIg = FMg + 23964 -- nightclub helper s.a. imports global (147773667)
NHPRg = FMg + 24595 -- nightclub helper pharmaceutical reseacrh global (-1188700671)
NHOPg = FMg + 23965 -- nightclub helper organic produce global (-1188963032)
NHPNCg = FMg + 23967 -- nightclub helper printing n copying global (967514627)
NHCCg = FMg + 23968 -- nightclub helper cash creation global (1983962738)
NHCKg1 = FMg + 24026 -- nightclub helper cooldown killer global 1 (1763921019)
NHCKg2 = FMg + 24067 -- nightclub helper cooldown killer global 2 (-1004589438)
NHCKg3 = FMg + 24068 -- nightclub helper cooldown killer global 3 (464940095)
NLSCg = FMg + 23680 -- night loop safe capacity global ("NIGHTCLUBMAXSAFEVALUE")
NLISg = FMg + 23657 -- night loop income start global ("NIGHTCLUBINCOMEUPTOPOP5")
NLIEg = FMg + 23676 -- night loop income end global ("NIGHTCLUBINCOMEUPTOPOP100")
NLCl = 181 + 32 + 1 -- night loop collect local

-- Special Cargo Variables
SCVPg = FMg + 15732 	-- special cargo vip price global ("EXEC_CONTRABAND_SALE_VALUE_THRESHOLD1")
SCVCKg1 = FMg + 15499 	-- special cargo vip cooldown global 1 ("EXEC_BUY_COOLDOWN")
SCVCKg2 = FMg + 15500 	-- special cargo vip cooldown global 2 ("EXEC_SELL_COOLDOWN")
SCVMTl = 545 + 7 		-- special cargo vip mission type local
SCVISl = 545 + 1 		-- special cargo vip instant sell local


-- Dripfeed Vehicles Variables
EDVg1 = FMg + 35629 -- enable dripfeed vehicles global 1 ("ENABLE_VEHICLE_ENVISAGE")
EDVg2 = FMg + 35630 -- enable dripfeed vehicles global 2 ("ENABLE_VEHICLE_EUROSX32")
EDVg3 = FMg + 35631 -- enable dripfeed vehicles global 3 ("ENABLE_VEHICLE_POLIMPALER5")
EDVg4 = FMg + 35632 -- enable dripfeed vehicles global 4 ("ENABLE_VEHICLE_POLGREENWOOD")
BEDVg5 = 2707347 -- enable dripfeed vehicles global 5 ("Bypass")
EDVg5 = FMg + 35633 -- enable dripfeed vehicles global 6 ("ENABLE_VEHICLE_PIPISTRELLO")
EDVg6 = FMg + 35634 -- enable dripfeed vehicles global 6 ("ENABLE_VEHICLE_POLIMPALER6")
EDVg7 = FMg + 35635 -- enable dripfeed vehicles global 7 ("ENABLE_VEHICLE_CASTIGATOR")
EDVg8 = FMg + 35636 -- enable dripfeed vehicles global 8 ("ENABLE_VEHICLE_DOMINATOR10")
EDVg9 = FMg + 35637 -- enable dripfeed vehicles global 9 ("ENABLE_VEHICLE_VORSCHLAGHAMMER")
EDVg10 = FMg + 35638 -- enable dripfeed vehicles global 10 ("ENABLE_VEHICLE_PARAGON3")
EDVg11 = FMg + 35639 -- enable dripfeed vehicles global 11 ("ENABLE_VEHICLE_POLDORADO")
EDVg12 = FMg + 35640 -- enable dripfeed vehicles global 12 ("ENABLE_VEHICLE_POLDOMINATOR10")
EDVg13 = FMg + 35641 -- enable dripfeed vehicles global 13 ("ENABLE_VEHICLE_NIOBE")
EDVg14 = FMg + 35642 -- enable dripfeed vehicles global 14 ("ENABLE_VEHICLE_COQUETTE5")
EDVg15 = FMg + 35643 -- enable dripfeed vehicles global 15 ("ENABLE_VEHICLE_PIZZABOY")
EVg1 = FMg + 34323 -- enables dripfeed vehicles ("ENABLE_VEHICLE_EXEMPLAR")

-- MC Business Variables
MCPwv = FMg + 17323   --  price of weed ("BIKER_WEED_PRODUCT_VALUE")
MCPmV = FMg + 17322   --  price of meth ("BIKER_METH_PRODUCT_VALUE")
MCPcockV = FMg + 17321   --  price of cocaine ("BIKER_CRACK_PRODUCT_VALUE")
MCPcashV = FMg + 17320   --  price of cash ("BIKER_COUNTERCASH_PRODUCT_VALUE")
MCPfakeV = FMg + 17319   --  price of fake ID ("BIKER_FAKEIDS_PRODUCT_VALUE")
MCPacidV = FMg + 17324   --  price of acid ("BIKER_ACID_PRODUCT_VALUE")

-- Collectibles Variables
CUg = 2708057 -- collectibles unlocker global ("cellphone_badger")
SJo = 211 -- signal jammers offset

-- Salvage Yard Variables
SYVVg = FMg + 33035 -- salvage yard vehicle value global ("SALV23_VEHICLE_ROBBERY_VALUE_0")
SYCKg = FMg + 33027 -- salvage yard can keep global ("SALV23_VEHICLE_ROBBERY_CAN_KEEP_0")
SYCg1 = FMg + 33064 --  salvage yard cooldown global ("SALV23_VEH_ROB_COOLDOWN_TIME")
SYCg2 = FMg + 3306 --  salvage yard cooldown global ("SALV23_CFR_COOLDOWN_TIME")
--GUN VAN VARIABLES
GVADg = FMg + 33303
GVWDg = FMg + 33284
GVTDg = FMg + 33295




-- Required Functions --

local function MoneyFormatter(n)
	n = tostring(n)
	return n:reverse():gsub("%d%d%d", "%1,"):reverse():gsub("^,", "")
end

	stat_ranges = {
		{stat = "PSTAT_BOOL", start = 0, finish = 191},
		{stat = "???", start = 192, finish = 512},
		{stat = "MP_PSTAT_BOOL", start = 513, finish = 704},
		{stat = "???", start = 705, finish = 2918},
		{stat = "MP_TUPSTAT_BOOL", start = 2919, finish = 3110},
		{stat = "TUPSTAT_BOOL", start = 3111, finish = 3878},
		{stat = "???", start = 3879, finish = 4206},
		{stat = "NGPSTAT_BOOL", start = 4207, finish = 4334},
		{stat = "MP_NGPSTAT_BOOL", start = 4335, finish = 4398},
		{stat = "???", start = 4399, finish = 6028},
		{stat = "NGTATPSTAT_BOOL", start = 6029, finish = 6412},
		{stat = "???", start = 6413, finish = 7320},
		{stat = "MP_NGDLCPSTAT_BOOL", start = 7321, finish = 7384},
		{stat = "NGDLCPSTAT_BOOL", start = 7385, finish = 7640},
		{stat = "???", start = 7641, finish = 9360},
		{stat = "DLCBIKEPSTAT_BOOL", start = 9361, finish = 9552},
		{stat = "???", start = 9553, finish = 15368},
		{stat = "DLCGUNPSTAT_BOOL", start = 15369, finish = 15560},
		{stat = "???", start = 15561, finish = 15561},
		{stat = "GUNTATPSTAT_BOOL", start = 15562, finish = 15945},
		{stat = "DLCSMUGCHARPSTAT_BOOL", start = 15946, finish = 16009},
		{stat = "???", start = 16010, finish = 18097},
		{stat = "GANGOPSPSTAT_BOOL", start = 18098, finish = 18161},
		{stat = "???", start = 18162, finish = 22065},
		{stat = "BUSINESSBATPSTAT_BOOL", start = 22066, finish = 22193},
		{stat = "???", start = 22194, finish = 24961},
		{stat = "ARENAWARSPSTAT_BOOL", start = 24962, finish = 25537},
		{stat = "???", start = 25538, finish = 26809},
		{stat = "CASINOPSTAT_BOOL", start = 26810, finish = 27257},
		{stat = "???", start = 27256, finish = 28097},
		{stat = "CASINOHSTPSTAT_BOOL", start = 28098, finish = 28353},
		{stat = "???", start = 28354, finish = 28354},
		{stat = "HEIST3TATTOOSTAT_BOOL", start = 28355, finish = 28482},
		{stat = "???", start = 28483, finish = 30226},
		{stat = "SU20PSTAT_BOOL", start = 30227, finish = 30354},
		{stat = "SU20TATTOOSTAT_BOOL", start = 30355, finish = 30482},
		{stat = "???", start = 30483, finish = 30514},
		{stat = "HISLANDPSTAT_BOOL", start = 30515, finish = 30706},
		{stat = "???", start = 30707, finish = 31706},
		{stat = "TUNERPSTAT_BOOL", start = 31707, finish = 32282},
		{stat = "FIXERPSTAT_BOOL", start = 32283, finish = 32410},
		{stat = "FIXERTATTOOSTAT_BOOL", start = 32411, finish = 32474},
		{stat = "???", start = 32475, finish = 34122},
		{stat = "GEN9PSTAT_BOOL", start = 34123, finish = 34250},
		{stat = "DLC12022PSTAT_BOOL", start = 34251, finish = 34762},
		{stat = "???", start = 34763, finish = 36626},
		{stat = "DLC22022PSTAT_BOOL", start = 36627, finish = 36946},
		{stat = "???", start = 36947, finish = 41250},
		{stat = "DLC22022TATTOOSTAT_BOOL", start = 41251, finish = 41314},
		{stat = "DLC12023PSTAT_BOOL", start = 41315, finish = 42082},
		{stat = "???", start = 42083, finish = 42106},
		{stat = "DLC22023PSTAT_BOOL", start = 42107, finish = 42298},
		{stat = "???", start = 42299, finish = 51058},
		{stat = "DLC22023TATTOOSTAT_BOOL", start = 51059, finish = 51186}
	}

local function stats_set_packed_bools(packed_bool_start, packed_bool_finish, bool)
	for i = packed_bool_start, packed_bool_finish do
		stats.set_packed_stat_bool(i, bool)
	end
end

local function changeSession(session)
	globals.set_int(CSg1, session)
	if session == -1 then
		globals.set_int(CSg3, -1)
	end
	sleep(0.5)
	globals.set_int(CSg2, 1)
	sleep(0.5)
	globals.set_int(CSg2, 0)
end
local function globals_set_ints(global_start, global_finish, step, value)
	for i = global_start, global_finish, step do
		globals.set_int(i, value)
	end
end

local function null() end



-- Heist Control Tab
Silent = gui.get_tab(">Gsxr's Heist Control<")
Silent:add_text("version 1.70")
Silent:add_text("YOUR RP LEVEL IS " .. stats.get_int(joaat(MPX() .. "CHAR_RANK_FM")))
Silent:add_text("YOUR CREW RANK IS " .. stats.get_int(joaat("MPPLY_CURRENT_CREW_RANK")))

-- Heist Editor tab
Heist_Editor = Silent:add_tab(">GsxrBrahs Heist Control<")

-- Agency tab

local contract_id = {3, 4, 12, 28, 60, 124, 252, 508, 2044, 4095, -1}
local CONTRACT_ID = {
    NIGHTCLUB_LEAK = 3,
    HIGH_SOCIETY_LEAK = 4,
    SOUTH_CENTRAL_LEAK = 10,
    DONT_FUCK_WITH_DRE = 11
}
local function setAgencyContract(contractId)
    stats.set_int(MPX() .. "FIXER_STORY_BS", contract_id[contractId])
end
local Agency = Heist_Editor:add_tab("Agency By GSXR")

Agency:add_button("Nightclub Leak", function() setAgencyContract(CONTRACT_ID.NIGHTCLUB_LEAK) end)
Agency:add_sameline()
Agency:add_button("High Society Leak", function() setAgencyContract(CONTRACT_ID.HIGH_SOCIETY_LEAK) end)
Agency:add_sameline()
Agency:add_button("South Central Leak", function() setAgencyContract(CONTRACT_ID.SOUTH_CENTRAL_LEAK) end)
Agency:add_sameline()
Agency:add_button("Don't Fuck With Dre", function() setAgencyContract(CONTRACT_ID.DONT_FUCK_WITH_DRE) end)
Agency:add_button("Complete Preps",
    function()
        stats.set_int(MPX() .. "FIXER_GENERAL_BS", -1)
        stats.set_int(MPX() .. "FIXER_COMPLETED_BS", -1)
        stats.set_int(MPX() .. "FIXER_STORY_COOLDOWN", -1)
    end)
Agency:add_separator()
Agency:add_text("Money")
local agencySafe = Agency:add_checkbox("Agency Safe Loop")
script.register_looped("agencyloop", function(script)
    script:yield()
    if agencySafe:is_enabled() == true then
        gui.show_message("Business Manager", "Supplying Agency Safe with money")
        STATS.STAT_SET_INT(joaat(MPX() .. "FIXER_COUNT"), 500, true)
        STATS.STAT_SET_INT(joaat(MPX() .. "FIXER_PASSIVE_PAY_TIME_LEFT"), -1, true)
        script:sleep(500)
    end
end)
Agency:add_separator()
Agency:add_text("Payouts:")
Agency:add_text("Set The Payout After The final mission starts:")
Agency:add_button("Max Payout", function() globals.set_int(APg, 2500000) end)
Agency:add_text("")
Agency:add_text("Custom Payout:")
local agencyPayout = Agency:add_input_int("Payout")
Agency:add_button("Set Payout", function() globals.set_int(APg, agencyPayout:get_value()) end)
Agency:add_separator()
Agency:add_text("After All choices and pressing Complete Preps wait for sometime")

-- Autoshop tab
local Autoshop = Heist_Editor:add_tab("Autoshop By GSXR")
Autoshop:add_text("Missions")

-- Define a function to set the contract index
local function setContractIndex(index)
  stats.set_int(MPX() .. "TUNER_CURRENT", index - 1)
end

-- Create a table to store contract data
local contracts = {
  { name = "Union Repository", index = 1 },
  { name = "The Superdollar Deal", index = 2 },
  { name = "The Bank Contract", index = 3 },
  { name = "The ECU Job", index = 4 },
  { name = "The Prison Contract", index = 5 },
  { name = "The Agency Deal", index = 6 },
  { name = "The Lost Contract", index = 7 },
  { name = "The Data Contract", index = 8 },
}

-- Loop through the contracts table to create buttons
for _, contract in ipairs(contracts) do
	
  Autoshop:add_button(contract.name, function()
    setContractIndex(contract.index)
  end)
  if contract.index ~= 4 then
		Autoshop:add_sameline()
  end
end

-- Complete Preps button
Autoshop:add_button("Complete Preps", function()
  script.run_in_fiber(function(script)
    local currentMission = stats.get_int(MPX() .. "TUNER_CURRENT")
    local prepValue = currentMission == 1 and 4351 or 12543
    stats.set_int(MPX() .. "TUNER_GEN_BS", prepValue)
    script:sleep(1000)
    locals.set_int("tuner_planning", ASRBl, 2) 
  end)
end)
Autoshop:add_separator()
Autoshop:add_text("Reload Planning")
Autoshop:add_button("Reload Planning",
function ()
	locals.set_int("tuner_planning", ASRBl, 2)
end
)
Autoshop:add_separator()
Autoshop:add_text("Payouts:")
Autoshop:add_button("Max Payout",
function()
	globals.set_float(ASFg, 0)
	for i = ASPg1, ASPg2 do
		globals.set_int(i, 2000000)
	end
end)
Autoshop:add_text("Custom Payout:")
local autoshopPayout = Autoshop:add_input_int("Payout")
Autoshop:add_button("Set Payout",
function ()
	globals.set_float(ASFg, 0)
	for i = ASPg1, ASPg2 do
		globals.set_int(i, autoshopPayout:get_value())
	end
end)
Autoshop:add_separator()
Autoshop:add_text("Instant Finish")
Autoshop:add_button("Instant Finish",
function ()
	locals.set_int("fm_mission_controller_2020", ASIFl1, 51338977)
	locals.set_int("fm_mission_controller_2020", ASIFl2, 101)
end
)

-- Salvage Yard --
local function set_all_vehicles_available()
    for i = 1, 3 do
        stats.set_int(MPX() .. "SALV23_VEHROB_STATUS" .. (i - 1), 0)
    end
end
local function YardPrepsSetter(value)
	stats.set_int(MPX() .. "SALV23_GEN_BS", value)
	stats.set_int(MPX() .. "SALV23_SCOPE_BS", value)
	stats.set_int(MPX() .. "SALV23_FM_PROG", value)
	stats.set_int(MPX() .. "SALV23_INST_PROG", value)
end

local availablity1 = 0
local availablity2 = 0
local availablity3 = 0
local claims = {
	"Unclaimable",
	"Claimable"
}
local vehicles = {
	"First Vehicle",
	"Second Vehicle",
	"Third Vehicle"
}
local salPrice = 0
local salvalues = {
	{ id = 1, name="First Vehicle"},
	{ id = 2, name="Second Vehicle"},
	{ id = 3, name="Third Vehicle"}
}
local vehicle = 0
local Salvage = Heist_Editor:add_tab("Salvage Yard By GSXR")
Salvage:add_text("Alter Vehicle Cost")
Salvage:add_text("")
Salvage:add_text("Set Vehicle value to $600,000 | Safe")
for _, salvalue in ipairs(salvalues) do
	Salvage:add_button(salvalue.name,
	function ()
		globals.set_int(SYVVg + salvalue.id, 600000)
	end)
	Salvage:add_sameline()
end
Salvage:add_imgui(
	function ()
		ImGui.Text("Custom Vehicle Value")
		salPrice = ImGui.InputInt("Price", salPrice)
		vehicle = ImGui.Combo("Vehicle", vehicle, vehicles, 3)
		if ImGui.Button("Set Vehicle Value") then
			globals.set_int(SYVVg + vehicle + 1, salPrice)
		end
		ImGui.Text("Set Availibility Status")
		ImGui.SetNextItemWidth(160)
		availablity1 = ImGui.Combo("", availablity1, claims, 2)
		ImGui.SameLine()
		ImGui.SetNextItemWidth(160)
		ImGui.SameLine()
		availablity2 = ImGui.Combo("  ", availablity2, claims, 2)
		ImGui.SameLine()
		ImGui.SetNextItemWidth(160)
		availablity3 = ImGui.Combo("   ", availablity3, claims, 2)
		if ImGui.Button("Set Claimability") then
			globals.set_int(SYCKg + 1, availablity1)
			globals.set_int(SYCKg + 2, availablity2)
			globals.set_int(SYCKg + 3, availablity3)
		end
	end
)
Salvage:add_separator()
Salvage:add_text("Set All vehicles as available")
Salvage:add_button("Set All vehicles as available", function() set_all_vehicles_available() end)
Salvage:add_text("Complete All Preps")
Salvage:add_button("Complete All Preps", function() YardPrepsSetter(-1) end)
Salvage:add_separator()
Salvage:add_text("Reset All preps")
Salvage:add_button("Reset All Preps", function() YardPrepsSetter(0) end)
Salvage:add_separator()
Salvage:add_text("Others")
Salvage:add_button("Kill Cooldown",
function()
	for i = SYCg1, SYCg2 do
		globals.set_int(i, 0)
	end
end)
Salvage:add_sameline()
Salvage:add_button("Reload Planning",
function()
	locals.set_int("vehrob_planning",512,2)
end)



-- Cluckin Bell --
local cluckperps = {
	{ id = 0 , name = "Slush Fund"},
	{ id = 1 , name = "Breaking and Entering"},
	{ id = 3 , name = "Concealed Rewards"},
	{ id = 7 , name = "Hit And Run"},
	{ id = 15, name = "Disorganized Crime"},
	{ id = 31, name = "Scene of Crime"}
}

local Cluck = Heist_Editor:add_tab("Cluckin Bell Heist By GSXR")

Cluck:add_text("Complete All Preps")

for _,cluckprep in ipairs(cluckperps) do
	Cluck:add_button(cluckprep.name,
	function ()
		stats.set_int(MPX() .. "SALV23_INST_PROG", cluckprep.id)
	end)
	Cluck:add_sameline()
end
Cluck:add_separator()
Cluck:add_text("Reset All preps")
Cluck:add_button("Reset All Preps",
function ()
	stats.set_int(MPX() .. "SALV23_INST_PROG", 0)
end
)


-- Cut Setter for Heist --

local function CutsPresetter(global_start, global_finish, cut)
	globals.set_int(GCg, cut)
	for i = global_start, global_finish do
		globals.set_int(i, cut)		
	end
end

-- Doomsday --
local function DoomsdayActSetter(progress, status)
	stats.set_int(MPX() .. "GANGOPS_FLOW_MISSION_PROG", progress)
	stats.set_int(MPX() .. "GANGOPS_HEIST_STATUS", status)
	stats.set_int(MPX() .. "GANGOPS_FLOW_NOTIFICATIONS", 1557)
end

local Doomsday = Heist_Editor:add_tab("Doomsday Heist By GSXR")
Doomsday:add_text("Doomsday Acts")
Doomsday:add_button("Data Breaches",
function ()
	DoomsdayActSetter(503, 229383)

end)
Doomsday:add_sameline()
Doomsday:add_button("Bogdan Problem",
function ()
	DoomsdayActSetter(240, 229378)
end)
Doomsday:add_sameline()
Doomsday:add_button("Doomsday Scenario",
function ()
	DoomsdayActSetter(16368, 229380)
end)

Doomsday:add_text("Set Doomsday Heist Cuts")
Doomsday:add_text("Preset Cut")
Doomsday:add_button("100",
function ()
	CutsPresetter(DCg1, DCg4, 100)
end
)
Doomsday:add_text("Custom Cuts")
local dmsdyCut1 = Doomsday:add_input_int("Cut 1")
local dmsdyCut2 = Doomsday:add_input_int("Cut 2")
local dmsdyCut3 = Doomsday:add_input_int("Cut 3")
local dmsdyCut4 = Doomsday:add_input_int("Cut 4")
Doomsday:add_button("Set Cuts",
function ()
	globals.set_int(DCg1, dmsdyCut1:get_value())
	globals.set_int(DCg2, dmsdyCut2:get_value())
	globals.set_int(DCg3, dmsdyCut3:get_value())
	globals.set_int(DCg4, dmsdyCut4:get_value())
end)
Doomsday:add_separator()
Doomsday:add_text("Preps")
Doomsday:add_button("Reset Preps",
function ()
	DoomsdayActSetter(240, 0)
end
)
Doomsday:add_sameline()
Doomsday:add_button("Complete Preps",
function ()
	stats.set_int(MPX() .. "GANGOPS_FM_MISSION_PROG", -1)
end
)
Doomsday:add_separator()
Doomsday:add_text("By pass Doomsday Scenario hack")
Doomsday:add_button("By Act III Pass hack",
function ()
	locals.set_int("fm_mission_controller", DDSHl, 3)
end
)
-- Casino Heist --
local CasinoHeist = Heist_Editor:add_tab("Diamond Casino Heist By GSXR")
CasinoHeist:add_text("Preps")
CasinoHeist:add_text("")
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
local casinoPrimaryTargets = {
	{ name="Diamond", value=3 },
	{ name="Gold", value=1 },
	{ name="Arts", value=2 },
	{ name="Cash", value=0 }
}
local casinoApproachs = {
	{ name="Silent & Sneaky", value=127 , settings={ 2, 1, 3, 1 }},
	{ name="Big Con", value=799, settings={ 1, 2, 3, 2 } },
	{ name="Aggressive", value=799, settings={ 1, 2, 3, 3 }}
}
CasinoHeist:add_text("Primary Target")

for _, casinoprimarytarget in ipairs(casinoPrimaryTargets) do
	CasinoHeist:add_button(casinoprimarytarget.name,
	function ()
		stats.set_int(MPX() .. "H3OPT_TARGET", casinoprimarytarget.value)
	end)
	CasinoHeist:add_sameline()
end
CasinoHeist:add_separator()
CasinoHeist:add_text("Select Apprach")
for _, casinoApproach in ipairs(casinoApproachs) do
	CasinoHeist:add_button(casinoApproach.name,
	function ()
		CasinoApproachSetter(casinoApproach.settings[1], casinoApproach.settings[2], casinoApproach.settings[3], casinoApproach.settings[4])
		stats.set_int(MPX() .. "H3OPT_BITSET1", casinoApproach.value)
		stats.set_int(MPX() .. "H3OPT_WEAPS", 0)
	end)
	CasinoHeist:add_sameline()
end
CasinoHeist:add_separator()
CasinoHeist:add_text("Gun Man")
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
	"Chester McCoy/Carbine Rifle Mk II"
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
	"Chester McCoy/Bullpup Rifle Mk II"
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
	"Chester McCoy/Assault Rifle Mk II"
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
	"Chester McCoy/Everon"

}
local hackerLoad = {
	"Select", "Rickie Lukens","Christian Feltz", "Yohan Blair", "Avi Schwartzman",  "Page Harris"
}
local maskLoad = {
	"Select", "Geometic Set", "Hunter Set", "Oni Half Mask Set", "Emoji Set", "Ornate Skull Set", "Lucky Fruit Set", "Guerilla Set", "Clown Set", "Animal Set", "Riot Set", "Oni Full Mask Set", "Hockey Set"
}
CasinoHeist:add_imgui(
	function ()
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
				stats.set_int(MPX() .. "H3OPT_CREWDRIVER",1)
				stats.set_int(MPX() .. "H3OPT_VEHS", driver)
			elseif driver <= 7 then
				stats.set_int(MPX() .. "H3OPT_CREWDRIVER",4)
				stats.set_int(MPX() .. "H3OPT_VEHS", driver- 4)
			elseif driver <= 11 then
				stats.set_int(MPX() .. "H3OPT_CREWDRIVER",2)
				stats.set_int(MPX() .. "H3OPT_VEHS", driver - 8)
			elseif driver <= 15 then
				stats.set_int(MPX() .. "H3OPT_CREWDRIVER",3)
				stats.set_int(MPX() .. "H3OPT_VEHS", driver - 12)
			elseif driver <= 19 then
				stats.set_int(MPX() .. "H3OPT_CREWDRIVER",5)
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
	end
	
)
CasinoHeist:add_separator()
CasinoHeist:add_button("Reload Planning Screen",
function ()
	locals.set_int("gb_casino_heist_planning", DCRBl, 2)
end
)
local CasinoHeistExtra = CasinoHeist:add_tab("Extras")
CasinoHeistExtra:add_text("Make Lester, Driver, Hacker, and Gunman cut to 0%")
CasinoHeistExtra:add_button("Make Fees to 0",
function ()
	globals.set_int(DCCgun, 0)
	globals.set_int(DCCh, 0)
	globals.set_int(DCCl, 0)
	globals.set_int(DCCd, 0)
end
)
CasinoHeistExtra:add_text("Hacks")
CasinoHeistExtra:add_button("Bypass Casino Fingerprint Hack",
function ()
	if locals.get_int("fm_mission_controller",DCFHl) == 4 then
		locals.set_int("fm_mission_controller",DCFHl, 5)
	end
end
)
CasinoHeistExtra:add_sameline()
CasinoHeistExtra:add_button("Bypass Keypad Hack",
function ()
	if locals.get_int("fm_mission_controller",DCKHl) ~= 4 then
		locals.set_int("fm_mission_controller",DCKHl, 5)
	end
end
)
CasinoHeistExtra:add_sameline()
CasinoHeistExtra:add_button("Bypass Drill Vault Door",
function ()
	locals.set_int("fm_mission_controller",DCDVDl1, locals.get_int("fm_mission_controller",DCDVDl2))
end
)
CasinoHeistExtra:add_button("Play the Heist Solo",
function()
	if locals.get_int("fmmc_launcher", 19709 + 34) ~= nil then
		if locals.get_int("fmmc_launcher", 19709 + 34) ~= 0 then
			if locals.get_int("fmmc_launcher", 19709 + 34) > 1 then
					locals.set_int("fmmc_launcher", 19709 + 15, 1)
                    globals.set_int(794744 + 4 + 1 + (locals.get_int("fmmc_launcher", 19709 + 34) * 89) + 69, 1)
			end
			globals.set_int(4718592 + 3526, 1)
            globals.set_int(4718592 + 3527, 1)
            globals.set_int(4718592 + 3529 + 1, 1)
            globals.set_int(4718592 + 178821 + 1, 0)
		end
	end
end)
CasinoHeistExtra:add_sameline()



-- Cayo Heist --

local cayoPrimaryTargets = {
	{name="Panther Statue", id = 5},
	{name="Medrazo Files", id = 4},
	{name="Diamond", id = 3},
	{name="Bonds", id = 2},
	{name="Necklace", id = 1},
	{name="Tequila", id = 0}
}

local function CayoCompletePreps()
	stats.set_int(MPX() .. "H4CNF_UNIFORM", -1)
	stats.set_int(MPX() .. "H4CNF_GRAPPEL", -1)
	stats.set_int(MPX() .. "H4CNF_TROJAN", 5)
	stats.set_int(MPX() .. "H4CNF_WEP_DISRP", 3)
	stats.set_int(MPX() .. "H4CNF_ARM_DISRP", 3)
	stats.set_int(MPX() .. "H4CNF_HEL_DISRP", 3)
	stats.set_int(MPX() .. "H4_PLAYTHROUGH_STATUS", 10)
	stats.set_int(MPX() .. "H4CNF_BS_GEN", -1)
	stats.set_int(MPX() .. "H4CNF_BS_ENTR", 63)
	stats.set_int(MPX() .. "H4CNF_BS_ABIL", 63)
	stats.set_int(MPX() .. "H4CNF_APPROACH", -1)
end
local function CayoTargetsSetter(cash, weed, coke, gold, where, target, value)
	stats.set_int(MPX() .. "H4LOOT_CASH_" .. where, cash)
	stats.set_int(MPX() .. "H4LOOT_CASH_" .. where .. "_SCOPED", cash)
	stats.set_int(MPX() .. "H4LOOT_WEED_" .. where, weed)
	stats.set_int(MPX() .. "H4LOOT_WEED_" .. where .. "_SCOPED", weed)
	stats.set_int(MPX() .. "H4LOOT_COKE_" .. where, coke)
	stats.set_int(MPX() .. "H4LOOT_COKE_" .. where .. "_SCOPED", coke)
	stats.set_int(MPX() .. "H4LOOT_GOLD_" .. where, gold)
	stats.set_int(MPX() .. "H4LOOT_GOLD_" .. where .. "_SCOPED", gold)
	stats.set_int(MPX() .. "H4LOOT_" .. target .. "_V", value)
end
local function CayoPaintingsToggler(Enabled)
	if Enabled then
		stats.set_int(MPX() .. "H4LOOT_PAINT", 127)
		stats.set_int(MPX() .. "H4LOOT_PAINT_SCOPED", 127)
		stats.set_int(MPX() .. "H4LOOT_PAINT_V", 189500)
	else
		stats.set_int(MPX() .. "H4LOOT_PAINT", 0)
		stats.set_int(MPX() .. "H4LOOT_PAINT_SCOPED", 0)
	end
end
local function CutsPresetter(global_start, global_finish, cut)
	globals.set_int(GCg, cut)
	for i = global_start, global_finish do
		globals.set_int(i, cut)
	end
end
local cayoSecondaryTargets = {
		{ name = "Gold", caps="GOLD", amount={
			compound ={
				cash=0, weed=0, coke=0, gold=255
			},
			island = {
				cash=0, weed=0, coke=0, gold=16777215
			}
		}, value = 330350},
		{ name = "Cocaine", caps="COKE",amount={
			compound ={
				cash=0, weed=0, coke=255, gold=0
			},
			island = {
				cash=0, weed=0, coke=16777215, gold=0
		}, value = 200095},
		{ name = "Meraguina", caps="WEED",amount={
			compound ={
				cash=0, weed=255, coke=0, gold=0
			},
			island = {
				cash=0, weed=16777215, coke=0, gold=0
				}
		}, value = 147870},
		{ name = "Cash", caps="CASH",amount={
			compound ={
				cash=255, weed=0, coke=0, gold=0
			},
			island = {
				cash=16777215, weed=0, coke=0, gold=0
			}
		}, value = 90000}
	}
}

local cayoLocations = {
	{name="Front Gate", x=4990.0386, y=-5717.6895, z=19.876024},
	{name="El Rubio's Office", x=5010.12, y=-5750.1353, z=28.844675},
	{name="Primary Target", x=5006.7, y=-5756.2, z=15.483983},
	{name="Secondary Target", x=4999.764160, y=-5749.863770, z=14.840000},
	{name="Safe Zone", x=4771.479, y=-6165.737, z=-39.079613},
	{name="Entrance Drinage Pipe", x=5043.74, y=-5815.3193, z=-10.574497},
	{name="Enter Cayo Perico", x=5053.8516, y=-5772.852, z=-4.1588774},
	{name="Elevator", x=5012.1533, y=-5749.0107, z=28.945145},
}
local cayoApproachVehicles = {
	{name="Longfin", id = 65345},
	{name="Patrol Boat", id = 65313},
	{name="Stealth Annihilator", id = 65425},
	{name="Velum", id = 65289},
	{name="Alkonost", id = 65413},
	{name="Kosatka", id = 65283},
}
local cayoWeapons = {
	{name="Aggressor", id = 1},
	{name="Conspirator", id = 2},
	{name="Crackshot", id = 3},
	{name="Saboteur", id = 4},
	{name="Marksman", id = 5},
}
local Cayo = Heist_Editor:add_tab("Cayo Perico Heist By GSXR")

Cayo:add_text("Cayo Bag Size Editor")
local cayobag = Cayo:add_input_int("Bag Size")
Cayo:add_button("Set Bag Size", 
function ()
	globals.set_int(CPBg, cayobag:get_value())
	gui.show_message("YOUR CAYO BAG SIZE HAS BEEN SET TO THE VALUE "..cayobag:get_value().." SUCCESSFULLY", "THANK YOU FOR USING THIS OPTION ツ MADE WITH <3 BY Someone")
end)

Cayo:add_separator()

Cayo:add_text("Primary Target")
for _, cayoPrimaryTarget in ipairs(cayoPrimaryTargets) do
	Cayo:add_button(cayoPrimaryTarget.name,
	function ()
		stats.set_int(MPX() .. "H4CNF_TARGET", cayoPrimaryTarget.id)
	end)
	Cayo:add_sameline()
end
Cayo:add_separator()
Cayo:add_text("Secondary targets")
Cayo:add_text("Compound:")
for _, cayoSecondaryTarget in ipairs(cayoSecondaryTargets) do
	Cayo:add_button(cayoSecondaryTarget.name,
	function ()
		CayoTargetsSetter(cayoSecondaryTarget.amount.compound.cash, cayoSecondaryTarget.amount.compound.weed, cayoSecondaryTarget.amount.compound.coke, cayoSecondaryTarget.amount.compound.gold, "C", cayoSecondaryTarget.caps, cayoSecondaryTarget.value)
	
	end)
	Cayo:add_sameline()
end
Cayo:add_text("")
Cayo:add_text("Island (Buggy!)")
for _, cayoSecondaryTarget in ipairs(cayoSecondaryTargets) do
	Cayo:add_button(cayoSecondaryTarget.name,
	function ()
		CayoTargetsSetter(cayoSecondaryTarget.amount.island.cash, cayoSecondaryTarget.amount.island.weed, cayoSecondaryTarget.amount.island.coke, cayoSecondaryTarget.amount.island.gold, "I", cayoSecondaryTarget.caps, cayoSecondaryTarget.value)
	end)
end
Cayo:add_text("")
Cayo:add_text("Add Paintings")
local addPaintings = Cayo:add_checkbox("Paintings")
Cayo:add_separator()
Cayo:add_text("Difficulty")
Cayo:add_button("Hard",
function ()
	stats.set_int(MPX() .. "H4_PROGRESS", 131055)
end
)
Cayo:add_sameline()
Cayo:add_button("Normal",
function ()
	stats.set_int(MPX() .. "H4_PROGRESS", 126823)
end
)
Cayo:add_separator()
Cayo:add_text("Approach")
for _, cayoApproachVehicle in ipairs(cayoApproachVehicles) do
	Cayo:add_button(cayoApproachVehicle.name,
	function ()
		stats.set_int(MPX() .. "H4_MISSIONS", cayoApproachVehicle.id)
	end)
	Cayo:add_sameline()
end
Cayo:add_separator()
Cayo:add_text("Weapons")
for _, cayoWeapon in ipairs(cayoWeapons) do
	Cayo:add_button(cayoWeapon.name,
	function ()
		stats.set_int(MPX() .. "H4CNF_WEAPONS", cayoWeapon.id)
	end)
	Cayo:add_sameline()
end
Cayo:add_separator()
Cayo:add_button("Complete Preps",
function ()
	CayoPaintingsToggler(addPaintings:is_enabled())
	CayoCompletePreps()
	locals.set_int("heist_island_planning", CPRSl, 2)
end
)
Cayo:add_separator()
Cayo:add_text("Cuts to All")
Cayo:add_button("100",
function ()
	CutsPresetter(CPCg1, CPCg4, 100)
end
)
Cayo:add_text("")
Cayo:add_text("Custom Cut")
local cayocut1 = Cayo:add_input_int("Cut 1")
local cayocut2 = Cayo:add_input_int("Cut 2")
local cayocut3 = Cayo:add_input_int("Cut 3")
local cayocut4 = Cayo:add_input_int("Cut 4")
Cayo:add_button("Set",
function ()
	globals.set_int(CPCg1, cayocut1:get_value())
	globals.set_int(CPCg2, cayocut2:get_value())
	globals.set_int(CPCg3, cayocut3:get_value())
	globals.set_int(CPCg4, cayocut4:get_value())
end)
Cayo:add_separator()
Cayo:add_text("Reload Planing Screen")
Cayo:add_button("Reload Planing Screen",
function ()
	locals.set_int("heist_island_planning", CPRSl, 2)
end
)
Cayo:add_separator()
Cayo:add_text("Extras")
Cayo:add_button("Bypass Drainge Cut",
function ()
	locals.set_int("fm_mission_controller_2020", CPSTCl, 6)
end
)
Cayo:add_sameline()
Cayo:add_button("Bypass Fingerprint Scanner",
function ()
	locals.set_int("fm_mission_controller_2020", CPFHl, 5)
end
)
Cayo:add_sameline()
Cayo:add_button("Bypass Plasma Cutter",
function ()
	locals.set_float("fm_mission_controller_2020", CPPCCl, 100.0)
end
)
Cayo:add_sameline()
Cayo:add_button("Remove All CCTV's",
function ()
	for _, ent in pairs(entities.get_all_objects_as_handles()) do
		for __, cam in pairs(CamList) do
			if ENTITY.GET_ENTITY_MODEL(ent) == cam then
				ENTITY.SET_ENTITY_AS_MISSION_ENTITY(ent, true, true)
				ENTITY.DELETE_ENTITY(ent)
			end
		end
	end
end
)
CamList = {
	joaat("prop_cctv_cam_01a"), joaat("prop_cctv_cam_01b"), joaat("prop_cctv_cam_02a"), joaat("prop_cctv_cam_03a"),
	joaat("prop_cctv_cam_04a"), joaat("prop_cctv_cam_04c"), joaat("prop_cctv_cam_05a"), joaat("prop_cctv_cam_06a"),
	joaat("prop_cctv_cam_07a"), joaat("prop_cs_cctv"), joaat("p_cctv_s"), joaat("hei_prop_bank_cctv_01"),
	joaat("hei_prop_bank_cctv_02"), joaat("ch_prop_ch_cctv_cam_02a"), joaat("xm_prop_x17_server_farm_cctv_01"),
}

Cayo:add_separator()
Cayo:add_text("Teleports")
for _, location in ipairs(cayoLocations) do
	Cayo:add_button(location.name,
	function ()
		local ped = PLAYER.PLAYER_PED_ID()
        PED.SET_PED_COORDS_KEEP_VEHICLE(ped, location.x, location.y, location.z)
	end)
	Cayo:add_sameline()
end

-- Apartment Heist --

local Apartment = Heist_Editor:add_tab("Apartment Heist By GSXR")
Apartment:add_text("Preps")
Apartment:add_button("Complete Preps", 
function ()
	stats.set_int(MPX() .. "HEIST_PLANNING_STAGE", -1)
end)
Apartment:add_sameline()
Apartment:add_button("Reset Preps", function()
	STATS.STAT_SET_INT(MPX() .. "HEIST_PLANNING_STAGE", 0)
end)
Apartment:add_text("")
Apartment:add_text("For Fleeca:")
Apartment:add_text("Pay for the preparation, start the first mission and as soon as you are sent to scout\nchange the session, come back to planning room, press \"Complete Preps\" near white board and press \"E\"")
Apartment:add_text("For Other Heist:")
Apartment:add_text("Start the mission and leave after the 1st cutscene ends, press \"Complete Preps\" near white board and press \"E\"")
Apartment:add_separator()
local remCD = Apartment:add_checkbox("Remove Cooldown")
script.register_looped("removeCool", function(remt)
    remt:yield()
    if remCD:is_enabled() == true then
		globals.set_int(1877285 + 1 + (PLAYER.PLAYER_ID() * 77) + 76, -1)
		remt:sleep(500)
	end
end)

local heistCuts = {
    [1328892776] = {-14806, 7453},
    [964111671] =  {-4184, 2142},
    [1131632450] = {-3074, 1587},
    [1967927346] = {-4100, 2100},
    [1182286714] = {-1900, 1000}
}

Apartment:add_button("15mil Payout By GSXR Currently Patched",
function()
script.run_in_fiber(function(ap)
	local key = globals.get_int(1877285 + (PLAYER.PLAYER_ID() * 77) + 24 + 2)
	local cuts = heistCuts[key]
	globals.set_int(ACg1, 100 - (cuts[2]*locals.get_int("fmmc_launcher", 19709 + 34)))
	globals.set_int(ACg2, cuts[2])
	if key ~= 1328892776 then
		globals.set_int(ACg3, cuts[2])
		globals.set_int(ACg4, cuts[2])
	end
    PAD.SET_CONTROL_VALUE_NEXT_FRAME(2, 201, 1)
	ap:sleep(1000)
    PAD.SET_CONTROL_VALUE_NEXT_FRAME(2, 202, 1)
	ap:sleep(1000)
	globals.set_int(ACg5, -1 * (-100 + cuts[1]) / 2)
end)
end)



local apartCut1 = 0
local apartCut2 = 0
local apartCut3 = 0
local apartCut4 = 0
Apartment:add_imgui(
	function ()
		PAD.DISABLE_CONTROL_ACTION(2, 237, true)
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
		if ImGui.Button("Set Cuts") then
			script.run_in_fiber(function(ccut)
			globals.set_int(ACg1, 100 - (apartCut1 * locals.get_int("fmmc_launcher", 19709 + 34)))
			globals.set_int(ACg2, apartCut2)
			globals.set_int(ACg3, apartCut3)
			globals.set_int(ACg4, apartCut4)
			PAD.SET_CONTROL_VALUE_NEXT_FRAME(2, 201, 1)
			ccut:sleep(1000)
    		PAD.SET_CONTROL_VALUE_NEXT_FRAME(2, 202, 1)
			ccut:sleep(1000)
			globals.set_int(ACg5, -1 * (-100 + globals.get_int(ACg1)) / 2)
		end)
	end
	end
)
Apartment:add_separator()

Apartment:add_text("Extras")
Apartment:add_button("Bypass Fleeca Hack",
function ()
	locals.set_int("fm_mission_controller", AFHl, 7)
end
)
Apartment:add_sameline()
Apartment:add_button("Bypass Fleeca Drill",
function ()
	locals.set_float("fm_mission_controller", AFDl, 100)
end
)
Apartment:add_sameline()
Apartment:add_button("Unlock All Heists",
function ()
	globals.set_int(1877285 + 1 + (PLAYER.PLAYER_ID() * 77 + 1) + 76, 31)
end
)
Apartment:add_sameline()
Apartment:add_button("Instant Finish",
function()
	locals.set_int("fm_mission_controller", AIFl3, 12)
	locals.set_int("fm_mission_controller", AIFl4, 99999)
	locals.set_int("fm_mission_controller", AIFl5, 99999)
end
)
Apartment:add_button("Play the Heist Solo",
function()
	if locals.get_int("fmmc_launcher", 19709 + 34) ~= nil then
		if locals.get_int("fmmc_launcher", 19709 + 34) ~= 0 then
			if locals.get_int("fmmc_launcher", 19709 + 34) > 1 then
					locals.set_int("fmmc_launcher", 19709 + 15, 1)
                    globals.set_int(794744 + 4 + 1 + (locals.get_int("fmmc_launcher", 19709 + 34) * 89) + 69, 1)
			end
			globals.set_int(4718592 + 3526, 1)
            globals.set_int(4718592 + 3527, 1)
            globals.set_int(4718592 + 3529 + 1, 1)
            globals.set_int(4718592 + 178821 + 1, 0)
		end
	end
end)
Apartment:add_text("")
Apartment:add_text("Note: After Clicking Unlock All Heists, restart the game to ensure no bugs happen -GSXRBRAH")


