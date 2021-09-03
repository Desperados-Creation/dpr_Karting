ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)

RegisterNetEvent('dpr_Karting:SpawnKart')
AddEventHandler('dpr_Karting:SpawnKart', function(Label, Value, Price)
    local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
    local car = Value
	
	if(xPlayer.getBank() >= Price) then
		xPlayer.removeAccountMoney('bank', Price)
        TriggerClientEvent('dpr_Karting:spawnCar',source,car)
        local xPlayers	= ESX.GetPlayers()
		for i=1, #xPlayers, 1 do
			local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
			Citizen.Wait(10000)
			TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Banque', 'Conseiller', 'Un prélèvement de ~r~'..Price..'$ ~s~a été effectué sur votre compte pour une location de karting !', 'CHAR_BANK_MAZE', 1)
		end
	else
		TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Banque', 'Conseiller', 'Vous n\'avez pas suffisament d\'argent sur votre compte bancaire!', 'CHAR_BANK_MAZE', 2)
	end	
end)