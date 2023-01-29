local QBCore = exports['qb-core']:GetCoreObject()
local insideLester = false
local LesterHouse = PolyZone:Create({
    vector2(1273.87, -1714.95),
    vector2(1274.74, -1716.98),
    vector2(1278.85, -1714.55),
    vector2(1276.05, -1708.7),
    vector2(1270.41, -1711.36),
    vector2(1271.5, -1713.62),
    vector2(1273.06, -1713.11)
}, {
    name="LesterHouse",
    minZ=51.0,
    maxZ=57.0,
    debugGrid=false,
    gridDivisions=25
})

Citizen.CreateThread(function()
    while true do
        local plyPed = PlayerPedId()
        local coord = GetEntityCoords(plyPed)
        insideLester = LesterHouse:isPointInside(coord)
        Citizen.Wait(500)
    end
end)

local function Success(success)
    local num1 = math.random(100, 500)
    local num2 = math.random(100, 500)

    if success then
        TriggerEvent("mhacking:hide")

        TriggerServerEvent('qb-phone:server:sendNewMail', {
            sender = 'Anonymous',
            subject = "Qualcosa di interessante...",
            message = 'Premi ✔ per sapere dove trovare Mr. Garcia',
            button = {
                enabled = true,
                buttonEvent = 'qb-blackmarket:Getjacklocation',
            }
        })

        if num1 == num2 then
            QBCore.Functions.Notify('La tua VPN si è bruciata :/', 'error', 5000)
        end

        QBCore.Functions.Notify('Controlla la tua email', 'success', 5000)
    else
        TriggerEvent("mhacking:hide")

        if num1 == num2 then
            QBCore.Functions.Notify('La tua VPN si è bruciata :/', 'error', 5000)
        end

        QBCore.Functions.Notify('Hai fallito l\'hacking', 'error', 5000)
    end
end

RegisterNetEvent('qb-blackmarket:Uselaptop', function()
    if insideLester == true then
        TriggerEvent("mhacking:show")
        TriggerEvent("mhacking:start", math.random(6, 7), math.random(20, 20), Success)
        QBCore.Functions.Notify('Sei connesso alla rete', 'success', 5000)
    else
        QBCore.Functions.Notify('Nessuna connessione...', 'error', 5000)
    end
end)




RegisterNetEvent('qb-blackmarket:Getjacklocation', function(data)
    local model = Config.model
    local coords2 = Config.Coords[math.random(#Config.Coords)]

    RequestModel(model)
    while not HasModelLoaded(model) do
    Wait(0)
    end
	
    RequestModel("g_m_y_mexgoon_03")
    while not HasModelLoaded("g_m_y_mexgoon_03") do
    Wait(0)
    end

    RequestModel("g_m_y_mexgoon_01")
    while not HasModelLoaded("g_m_y_mexgoon_01") do
    Wait(0)
    end

    RequestModel("a_m_y_mexthug_01")
    while not HasModelLoaded("a_m_y_mexthug_01") do
    Wait(0)
    end

    RequestModel("g_m_y_mexgang_01")
    while not HasModelLoaded("g_m_y_mexgang_01") do
    Wait(0)
    end	

	
    entity = CreatePed(0, model, coords2, true, false)
    entity2 = CreatePed(0, "g_m_y_mexgoon_03", coords2.x+2.0, coords2.y, coords2.z, coords2.w, true, false)
    entity3 = CreatePed(0, "g_m_y_mexgoon_01", coords2.x+4.0, coords2.y, coords2.z, coords2.w, true, false)
    entity4 = CreatePed(0, "a_m_y_mexthug_01", coords2.x-2.0, coords2.y, coords2.z, coords2.w, true, false)
    entity5 = CreatePed(0, "g_m_y_mexgang_01", coords2.x-4.0, coords2.y, coords2.z, coords2.w, true, false)
	
	AddRelationshipGroup('BlackMarket')
	SetPedRelationshipGroupHash(entity, 'BlackMarket')
	SetPedRelationshipGroupHash(entity2, 'BlackMarket')
	SetPedRelationshipGroupHash(entity3, 'BlackMarket')
	SetPedRelationshipGroupHash(entity4, 'BlackMarket')
	SetPedRelationshipGroupHash(entity5, 'BlackMarket')	
		
	SetPedCombatAbility(entity, 100)
    SetRelationshipBetweenGroups(5, PlayerPedId(), GetHashKey(entity))
    GiveWeaponToPed(entity,	GetHashKey("WEAPON_ASSAULTRIFLE"), 9999, 0, 1)	
	SetCurrentPedWeapon(entity,	GetHashKey("WEAPON_ASSAULTRIFLE"), true)
	SetPedDropsWeaponsWhenDead(entity, false)
	
	SetPedCombatAbility(entity2, 100)
    SetRelationshipBetweenGroups(5, PlayerPedId(), GetHashKey(entity2))
    GiveWeaponToPed(entity2,	GetHashKey("WEAPON_ASSAULTRIFLE"), 9999, 0, 1)	
	SetCurrentPedWeapon(entity2,	GetHashKey("WEAPON_ASSAULTRIFLE"), true)
	SetPedDropsWeaponsWhenDead(entity2, false)

	SetPedCombatAbility(entity3, 100)
    SetRelationshipBetweenGroups(5, PlayerPedId(), GetHashKey(entity3))
    GiveWeaponToPed(entity3,	GetHashKey("WEAPON_ASSAULTRIFLE"), 9999, 0, 1)	
	SetCurrentPedWeapon(entity3,	GetHashKey("WEAPON_ASSAULTRIFLE"), true)
	SetPedDropsWeaponsWhenDead(entity3, false)

	SetPedCombatAbility(entity4, 100)
    SetRelationshipBetweenGroups(5, PlayerPedId(), GetHashKey(entity4))
    GiveWeaponToPed(entity4,	GetHashKey("WEAPON_ASSAULTRIFLE"), 9999, 0, 1)	
	SetCurrentPedWeapon(entity4,	GetHashKey("WEAPON_ASSAULTRIFLE"), true)
	SetPedDropsWeaponsWhenDead(entity4, false)	
    SetNewWaypoint(coords2)

	SetPedCombatAbility(entity5, 100)
    SetRelationshipBetweenGroups(5, PlayerPedId(), GetHashKey(entity5))
    GiveWeaponToPed(entity5,	GetHashKey("WEAPON_ASSAULTRIFLE"), 9999, 0, 1)	
	SetCurrentPedWeapon(entity5,	GetHashKey("WEAPON_ASSAULTRIFLE"), true)
	SetPedDropsWeaponsWhenDead(entity5, false)	
    SetNewWaypoint(coords2)	
end)

RegisterNetEvent('qb-blackmarket:Jackmenu', function()
    local jackList = {}

    jackList[#jackList + 1] = {
        isMenuHeader = true,
        header = 'Mr. Garcia',
        icon = 'fa-solid fas fa-shop'
    }

    for k,v in pairs(Config.Items) do
        jackList[#jackList + 1] = {
            header = QBCore.Shared.Items[k].label,
            txt = '$'.. v,
            icon = k,
            params = {
                isServer = true,
                event = 'qb-blackmarket:Buyitems',
                args = {
                    item = k,
                    price = v,
                }
            }
        }
    end

    jackList[#jackList + 1] = {
        header = 'close',
        icon = 'fas fa-xmark',
        params = {
            event = 'qb-menu:client:closeMenu',
        }
    }

    exports['qb-menu']:openMenu(jackList)
end)

Citizen.CreateThread(function()
local models = {
    Config.model,
  }

  exports['qb-target']:AddTargetModel(models, {
    options = {
      {
        num = 1,
        type = "client",
        event = "qb-blackmarket:Jackmenu",
        icon = 'fas fa-face-laugh-wink',
        label = 'Mr. Garcia',
        canInteract = function(entity, distance, data) 
          if GetEntityHealth(entity) <= 190 then return false end 
          return true
        end,

      }
    },
    distance = 1.5,
  })
end)

