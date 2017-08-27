--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Planet config

local function GetPlanet(planetUtilities, planetID)
	
	local image = planetUtilities.planetImages[math.floor(math.random()*#planetUtilities.planetImages) + 1]
	
	local planetData = {
		name = "Folsom",
		startingPlanet = true,
		mapDisplay = {
			x = (planetUtilities.planetPositions and planetUtilities.planetPositions[planetID][1]) or 0.05,
			y = (planetUtilities.planetPositions and planetUtilities.planetPositions[planetID][2]) or 0.87,
			image = image,
			size = planetUtilities.PLANET_SIZE_MAP,
		},
		infoDisplay = {
			image = image,
			size = planetUtilities.PLANET_SIZE_INFO,
			backgroundImage = planetUtilities.backgroundImages[math.floor(math.random()*#planetUtilities.backgroundImages) + 1],
			terrainType = "Terran",
			radius = "6550 km",
			primary = "Origin",
			primaryType = "G8V",
			milRating = 1,
			text = [[Your first battle will be straightforward. You have been provided with a starting base. Construct an army of Glaives and Warriors and overwhelm your enemy.]]
		},
		gameConfig = {
			gameName = "Quick Tutorial",
			mapName = "FolsomDamDeluxeV4",
			playerConfig = {
				startX = 300,
				startZ = 3800,
				allyTeam = 0,
				commanderParameters = {
					facplop = false,
					defeatIfDestroyedObjectiveID = 2,
				},
				extraUnlocks = {
					"factorycloak",
					"cloakraid",
					"staticmex",
					"energysolar",
					"staticradar",
				},
			},
			aiConfig = {
				{
					startX = 4000,
					startZ = 75,
					aiLib = "NullAI",
					humanName = "Ally",
					allyTeam = 0,
					unlocks = {},
					commander = false,
				},
				{
					startX = 4000,
					startZ = 75,
					aiLib = "NullAI",
					humanName = "Enemy",
					allyTeam = 1,
					unlocks = {},
					commander = false,
				},
			},
			defeatConditionConfig = {
				-- Indexed by allyTeam.
				[0] = {},
				[1] = {
					ignoreUnitLossDefeat = true,
					allyTeamLossObjectiveID = 1,
				},
			},
			objectiveConfig = {
				-- This is just related to displaying objectives on the UI.
				[1] = {
					description = "Destroy the enemy Commander and Cloaky Bot Factory",
				},
				[2] = {
					description = "Protect your Commander",
				},
			},
			bonusObjectiveConfig = {
			}
		},
		completionReward = {
			experience = planetUtilities.MAIN_EXP,
			units = {
				"factorycloak",
				"cloakraid"
			},
			modules = {
			},
			abilities = {
			},
			codexEntries = {
			}
		},
	}
	
	return planetData
end

return GetPlanet