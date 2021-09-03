ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)

-- Menu --
local open = false
local MenuKarting = RageUI.CreateMenu("Karting", "INTERACTION")
MenuKarting.Display.Header = true 
MenuKarting.Closed = function()
  open = false
end

function OpenKartingMenu() 
    if open then 
        open = false
        RageUI.Visible(MenuKarting, false)
        return
    else
        open = true
        RageUI.Visible(MenuKarting, true)
        CreateThread(function()
            while open do 
                RageUI.IsVisible(MenuKarting, function()
                    RageUI.Separator("↓     ~o~Rendre     ~s~↓")
                    RageUI.Button("Rendre le kart", nil, {RightLabel = "~y~→"}, true, {
                        onSelected = function()
                            local veh,dist4 = ESX.Game.GetClosestVehicle(playerCoords)
                            if dist4 < 4 then
                                DeleteEntity(veh)
                                ESX.ShowAdvancedNotification("Karting", "~o~Location Karting", "Le véhicule a bien été ~o~rentrer~s~. Merci à vous !", "CHAR_DOM", 1)
                                RageUI.CloseAll()
                            end
                        end
                    })

                    RageUI.Separator("↓     ~o~Kartes     ~s~↓")
                    for k, v in pairs(Config.Kart) do
                        RageUI.Button(""..v.Label, nil, {RightLabel = "~r~"..v.Price.."$"}, true, {
                            onSelected = function()
                                TriggerServerEvent('dpr_Karting:SpawnKart', v.Label, v.Value, v.Price)
                                RageUI.CloseAll()
                            end
                        })
                    end
                    RageUI.Separator("↓     ~r~Fermeture     ~s~↓")
                    RageUI.Button("~r~Fermer", nil, {RightLabel = "~y~→→"}, true, {onSelected = function() RageUI.CloseAll() end})
                end)    
            Wait(0)    
            end
        end)
    end
end

Citizen.CreateThread(function()
    while true do
		local wait = 750

		for k, v in pairs(Config.positionKarting.LocationKart) do
			local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local pos = Config.positionKarting.LocationKart
			local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, v.x, v.y, v.z)

			if dist <= 10.0 then
			wait = 0
            DrawMarker(Config.MarkerType, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0.0,0.0,0.0, Config.MarkerSizeLargeur, Config.MarkerSizeEpaisseur, Config.MarkerSizeHauteur, Config.MarkerColorR, Config.MarkerColorG, Config.MarkerColorB, Config.MarkerOpacite, Config.MarkerSaute, true, p19, Config.MarkerTourne)  

				if dist <= 2.0 then
				wait = 0
					Visual.Subtitle(Config.Text, 1) 
					if IsControlJustPressed(1,51) then
						OpenKartingMenu()
					end
				end
			end
        end
    Citizen.Wait(wait)
	end
end)

-- Spawn du véhicule --
RegisterNetEvent('dpr_Karting:spawnCar')
AddEventHandler('dpr_Karting:spawnCar', function(car)
    Citizen.Wait(3000) -- Temps de spawn 1000 = 1 seconde
    local car = GetHashKey(car)
    local retval = PlayerPedId()

    RequestModel(car)
    while not HasModelLoaded(car) do
        RequestModel(car)
        Citizen.Wait(0)
    end

    local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
    local vehicle = CreateVehicle(car, -152.68, -2140.25, 16.0, 200.09, true, false)
    ESX.ShowAdvancedNotification("Karting", "~o~Location kart", "Votre ~o~kart ~s~à bien été sortie ! ~o~Bonne course ~s~!", "CHAR_DOM", 1)
end)

-- Blip --
Citizen.CreateThread(function()
	for k, v in pairs(Config.positionKarting.LocationKart) do
		local blip = AddBlipForCoord(v.x, v.y, v.z)

		SetBlipSprite(blip, 127)
		SetBlipScale (blip, 0.7)
		SetBlipColour(blip, 17)
		SetBlipAsShortRange(blip, true)

		BeginTextCommandSetBlipName('STRING')
		AddTextComponentSubstringPlayerName('Karting')
		EndTextCommandSetBlipName(blip)
	end
end)

-- Ped --
DecorRegister("Karting", 4)
pedHash = "a_m_y_latino_01"
zone = vector3(-162.8, -2130.89, 15.7)
Heading = 197.48
Ped = nil

Citizen.CreateThread(function()
    LoadModel(pedHash)
    Ped = CreatePed(2, GetHashKey(pedHash), zone, Heading, 0, 0)
    DecorSetInt(Ped, "Karting", 5431)
    FreezeEntityPosition(Ped, 1)
    SetEntityInvincible(Ped, true)
    SetBlockingOfNonTemporaryEvents(Ped, 1)
    end)

function LoadModel(model)
    while not HasModelLoaded(model) do
        RequestModel(model)
        Wait(1)
    end
end