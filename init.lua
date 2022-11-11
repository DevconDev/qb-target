function Load(name)
	local resourceName = GetCurrentResourceName()
	local chunk = LoadResourceFile(resourceName, ('data/%s.lua'):format(name))
	if chunk then
		local err
		chunk, err = load(chunk, ('@@%s/data/%s.lua'):format(resourceName, name), 't')
		if err then
			error(('\n^1 %s'):format(err), 0)
		end
		return chunk()
	end
end

-------------------------------------------------------------------------------
-- Settings
-------------------------------------------------------------------------------

Config = {}

-- It's possible to interact with entities through walls so this should be low
Config.MaxDistance = 7.0

-- Enable debug options
Config.Debug = false

-- Supported values: true, false
Config.Standalone = false

-- Enable outlines around the entity you're looking at
Config.EnableOutline = false

-- Whether to have the target as a toggle or not
Config.Toggle = false

-- Draw a Sprite on the center of a PolyZone to hint where it's located
Config.DrawSprite = false

-- The default distance to draw the Sprite
Config.DrawDistance = 10.0

-- The color of the sprite in rgb, the first value is red, the second value is green, the third value is blue and the last value is alpha (opacity). Here is a link to a color picker to get these values: https://htmlcolorcodes.com/color-picker/
Config.DrawColor = {255, 255, 255, 255}

-- The color of the sprite in rgb when the PolyZone is targeted, the first value is red, the second value is green, the third value is blue and the last value is alpha (opacity). Here is a link to a color picker to get these values: https://htmlcolorcodes.com/color-picker/
Config.SuccessDrawColor = {30, 144, 255, 255}

-- The color of the outline in rgb, the first value is red, the second value is green, the third value is blue and the last value is alpha (opacity). Here is a link to a color picker to get these values: https://htmlcolorcodes.com/color-picker/
Config.OutlineColor = {255, 255, 255, 255}

-- Enable default options (Toggling vehicle doors)
Config.EnableDefaultOptions = true

-- Disable the target eye whilst being in a vehicle
Config.DisableInVehicle = false

-- Key to open the target eye, here you can find all the names: https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/keyboard/
Config.OpenKey = 'LMENU' -- Left Alt

-- Control for key press detection on the context menu, it's the Right Mouse Button by default, controls are found here https://docs.fivem.net/docs/game-references/controls/
Config.MenuControlKey = 238

-------------------------------------------------------------------------------
-- Target Configs
-------------------------------------------------------------------------------

-- These are all empty for you to fill in, refer to the .md files for help in filling these in

Config.CircleZones = {

}

Config.BoxZones = {
	["happyshark"] = { -- This can be a string or a number
    name = "happyshark", -- This is the name of the zone recognized by PolyZone, this has to be unique so it doesn't mess up with other zones
    coords = vector3(376.67, -972.22, 29.44), -- These are the coords for the zone, this has to be a vector3 and the coords have to be a float value, fill in x, y and z with the coords
    length = 1.5, -- The length of the boxzone calculated from the center of the zone, this has to be a float value
    width = 0.4, -- The width of the boxzone calculated from the center of the zone, this has to be a float value
    heading = 90.0, -- The heading of the boxzone, this has to be a float value
    debugPoly = false, -- This is for enabling/disabling the drawing of the box, it accepts only a boolean value (true or false), when true it will draw the polyzone in green
    minZ = 25.84, -- This is the bottom of the boxzone, this can be different from the Z value in the coords, this has to be a float value
    maxZ = 29.84, -- This is the top of the boxzone, this can be different from the Z value in the coords, this has to be a float value
    options = { -- This is your options table, in this table all the options will be specified for the target to accept
      { -- This is the first table with options, you can make as many options inside the options table as you want
        num = 1, -- This is the position number of your option in the list of options in the qb-target context menu (OPTIONAL)
        type = "server", -- This specifies the type of event the target has to trigger on click, this can be "client", "server", "command" or "qbcommand", this is OPTIONAL and will only work if the event is also specified
        event = "QBCore:ToggleDuty", -- This is the event it will trigger on click, this can be a client event, server event, command or qbcore registered command, NOTICE: Normal command can't have arguments passed through, QBCore registered ones can have arguments passed through
        icon = 'fas fa-circle', -- This is the icon that will display next to this trigger option
        label = 'Toggle Duty', -- This is the label of this option which you would be able to click on to trigger everything, this has to be a string
        job = 'happyshark', -- This is the job, this option won't show up if the player doesn't have this job, this can also be done with multiple jobs and grades, if you want multiple jobs you always need a grade with it: job = {["police"] = 0, ["ambulance"] = 2},
        drawDistance = 10.0, -- This is the distance for the sprite to draw if Config.DrawSprite is enabled, this is in GTA Units (OPTIONAL)
        drawColor = {255, 255, 255, 255}, -- This is the color of the sprite if Config.DrawSprite is enabled, this will change the color for this PolyZone only, if this is not present, it will fallback to Config.DrawColor, for more information, check the comment above Config.DrawColor (OPTIONAL)
        successDrawColor = {30, 144, 255, 255}, -- This is the color of the sprite if Config.DrawSprite is enabled, this will change the color for this PolyZone only, if this is not present, it will fallback to Config.DrawColor, for more information, check the comment above Config.DrawColor (OPTIONAL)
      }
    },
    distance = 2.5, -- This is the distance for you to be at for the target to turn blue, this is in GTA units and has to be a float value
  },
  ["happysharkbank"] = {
	name = "HappySharkBank",
	coords = vector3(375.11, -978.53, 29.44),
	length = 0.5,
	width = 0.1,
	heading = 10.0,
	debugPoly = false,
	minZ = 26.04,
	maxZ = 30.04,
	options = {
		{
			type = "client",
			event = "qb-banking:openBankScreen",
			icon = "fas fa-sign-in-alt",
			label = "Sign In",
			job = "happyshark",
		},
	},
	distance = 2.5
},
["mechaniccraft"] = {
        name = "Mechanic Toolbox",
        coords = vector3(136.7, -3051.41, 7.04),
        length = 1,
        width = 1,
        heading = 0,
        debugPoly = false,
        minZ=3.44,
        maxZ=7.44,
        options = {
            {
                type = "client",
                event = "craft:mechanicparts", 
                icon = "fas fa-wrench",
                label = "Craft",
                job = "mechanic",
            },
        },
        distance = 2.5
    },
   
}

Config.PolyZones = {

}

Config.TargetBones = {
["mechanic"] = {
        bones = {
            "door_dside_f",
            "door_dside_r",
            "door_pside_f",
            "door_pside_r"
        },
        options = {
            {
                type = "client",
                event = "craft:vehmenu",
                icon = "fad fa-key",
                label = "Vehicle Menu",
                job = "mechanic",
            },
        },
        distance = 3.0
    },
}

Config.TargetModels = {
	["burgershotgarage"] = {
			models = {
				"ig_floyd"
			},
			options = {
				{
					type = "client",
					event = "garage:BurgerShotGarage",
					icon = "fas fa-car",
					label = "BurgerShot Garage",
					job = "burgershot",
				}
			},
			distance = 2.5,
		},
		["drinkVending"] = {
			models =     {
				"prop_vend_soda_01",
				"prop_vend_soda_02",
				"prop_vend_water_01",
			},
			options = {
				{
					type = "client",
					event = 'vendingDrink:buy',
					icon = "fas fa-shopping-basket",
					label = "Insert Coin",
				},
			},
			distance = 2.5
		},
		["vendingSnack"] = {
			models =     {
				"prop_vend_snak_01",
				"prop_vend_snak_01_tu",
			},
			options = {
				{
					type = "client",
					event = 'vendingSnack:buy',
					icon = "fas fa-shopping-basket",
					label = "Insert Coin",
				},
			},
			distance = 2.5
		},
		["vendingCoffee"] = {
			models =     {
				"prop_vend_coffe_01",
				"apa_mp_h_acc_coffeemachine_01",
			},
			options = {
				{
					type = "client",
					event = 'vendingCoffee:buy',
					icon = "fas fa-shopping-basket",
					label = "Insert Coin",
				},
			},
			distance = 2.5
		},
		["ems docmz"] = {
			models = {
				"s_m_m_doctor_01",
			},
			options = {
				{
					type = "client",
					event = "qb-ambulancejob:checkin",
					icon = "fas fa-circle",
					label = "Check In",
				},
			},
			distance = 2.5,
		},
		["bank teller"] = {
			models = {
				"u_m_m_bankman",
			},
			options = {
				{
					type = "client",
					event = "qb-banking:openBankScreen",
					icon = "fas fa-circle",
					label = "Access Account",
				},
			},
			distance = 2.5,
		},
		["stealing"] = {
			models = {
				"v_ret_247shelves01",
				"v_ret_247shelves02",
				"v_ret_247shelves03",
				"v_ret_247shelves04",
				"v_ret_247shelves05"
			},
			options = {
				{
					type = "client",
					event = "qb-shoplifting:client:doStuff",
					icon = "fas fa-toolbox",
					label = "Shoplift",
				}
			},
			distance = 1.0
		},
	
			["stealAlc"] = {
			models = {
				"v_ret_ml_liqshelfc",
			},
			options = {
				{
					type = "client",
					event = "qb-shoplifting:client:shopLiftAcohol",
					icon = "fas fa-toolbox",
					label = "Shoplift Alcohol",
				}
			},
			distance = 1.0
		},
}

Config.GlobalPedOptions = {

}

Config.GlobalVehicleOptions = {

}

Config.GlobalObjectOptions = {

}

Config.GlobalPlayerOptions = {

}

Config.Peds = {
	{                  --EMS DOCMZ
	model = 's_m_m_doctor_01',
	coords = vector4(-435.19, -324.14, 34.91, 153.41),
	minusOne = true,
	freeze = true,
	invincible = true,
	blockevents = true
},
----banks
{ 
	model = 'u_m_m_bankman', ---legionpark
	coords = vector4(149.45, -1042.13, 29.37, 338.33),
	minusOne = true,
	freeze = true,
	invincible = true,
	blockevents = true
},
{                  --near pink cage
	model = 'u_m_m_bankman',
	coords = vector4(313.75, -280.45, 54.16, 334.3),
	minusOne = true,
	freeze = true,
	invincible = true,
	blockevents = true
},
{                  --near LSC
	model = 'u_m_m_bankman',
	coords = vector4(-351.41, -51.27, 49.04, 340.99),
	minusOne = true,
	freeze = true,
	invincible = true,
	blockevents = true
},
{                  --near Hayes Auto
	model = 'u_m_m_bankman',
	coords = vector4(-1211.94, -331.93, 37.78, 24.71),
	minusOne = true,
	freeze = true,
	invincible = true,
	blockevents = true
},
{                  --pacific bank
	model = 'u_m_m_bankman',
	coords = vector4(248.83, 224.45, 106.29, 158.88),
	minusOne = true,
	freeze = true,
	invincible = true,
	blockevents = true
},
{                  --pacific bank 2
	model = 'u_m_m_bankman',
	coords = vector4(247.03, 225.0, 106.29, 159.76),
	minusOne = true,
	freeze = true,
	invincible = true,
	blockevents = true
},

{                  --great ocean
	model = 'u_m_m_bankman',
	coords = vector4(-2961.13, 482.85, 15.7, 83.25),
	minusOne = true,
	freeze = true,
	invincible = true,
	blockevents = true
},
{                  --sandy shores
	model = 'u_m_m_bankman',
	coords = vector4(1174.98, 2708.21, 38.09, 175.52),
	minusOne = true,
	freeze = true,
	invincible = true,
	blockevents = true
},
{                  --paleto
	model = 'u_m_m_bankman',
	coords = vector4(-112.22, 6471.03, 31.63, 131.47),
	minusOne = true,
	freeze = true,
	invincible = true,
	blockevents = true
},

}

-------------------------------------------------------------------------------
-- Functions
-------------------------------------------------------------------------------
local function JobCheck() return true end
local function GangCheck() return true end
local function ItemCheck() return true end
local function CitizenCheck() return true end

CreateThread(function()
	local state = GetResourceState('qb-core')
	if state ~= 'missing' then
		local timeout = 0
		while state ~= 'started' and timeout <= 100 do
			timeout += 1
			state = GetResourceState('qb-core')
			Wait(0)
		end
		Config.Standalone = false
	end
	if Config.Standalone then
		local firstSpawn = false
		local event = AddEventHandler('playerSpawned', function()
			SpawnPeds()
			firstSpawn = true
		end)
		-- Remove event after it has been triggered
		while true do
			if firstSpawn then
				RemoveEventHandler(event)
				break
			end
			Wait(1000)
		end
	else
		local QBCore = exports['qb-core']:GetCoreObject()
		local PlayerData = QBCore.Functions.GetPlayerData()

		ItemCheck = QBCore.Functions.HasItem

		JobCheck = function(job)
			if type(job) == 'table' then
				job = job[PlayerData.job.name]
				if job and PlayerData.job.grade.level >= job then
					return true
				end
			elseif job == 'all' or job == PlayerData.job.name then
				return true
			end
			return false
		end

		GangCheck = function(gang)
			if type(gang) == 'table' then
				gang = gang[PlayerData.gang.name]
				if gang and PlayerData.gang.grade.level >= gang then
					return true
				end
			elseif gang == 'all' or gang == PlayerData.gang.name then
				return true
			end
			return false
		end

		CitizenCheck = function(citizenid)
			return citizenid == PlayerData.citizenid or citizenid[PlayerData.citizenid]
		end

		RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
			PlayerData = QBCore.Functions.GetPlayerData()
			SpawnPeds()
		end)

		RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
			PlayerData = {}
			DeletePeds()
		end)

		RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
			PlayerData.job = JobInfo
		end)

		RegisterNetEvent('QBCore:Client:OnGangUpdate', function(GangInfo)
			PlayerData.gang = GangInfo
		end)

		RegisterNetEvent('QBCore:Player:SetPlayerData', function(val)
			PlayerData = val
		end)
	end
end)

function CheckOptions(data, entity, distance)
	if distance and data.distance and distance > data.distance then return false end
	if data.job and not JobCheck(data.job) then return false end
	if data.excludejob and JobCheck(data.excludejob) then return false end
	if data.gang and not GangCheck(data.gang) then return false end
	if data.excludegang and GangCheck(data.excludegang) then return false end
	if data.item and not ItemCheck(data.item) then return false end
	if data.citizenid and not CitizenCheck(data.citizenid) then return false end
	if data.canInteract and not data.canInteract(entity, distance, data) then return false end
	return true
end
