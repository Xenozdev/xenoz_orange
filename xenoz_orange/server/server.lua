TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- Farm

RegisterNetEvent('recolteorange')
AddEventHandler('recolteorange', function()
    local item = "orange"
    local limiteitem = 50
    local xPlayer = ESX.GetPlayerFromId(source)
    local nbitemdansinventaire = xPlayer.getInventoryItem(item).count
    

    if nbitemdansinventaire >= limiteitem then
        TriggerClientEvent('esx:showNotification', source, "Ta pas assez de place dans ton inventaire!")
        recoltepossible = false
    else
        xPlayer.addInventoryItem(item, 1)
        TriggerClientEvent('esx:showNotification', source, "Récolte en cours...")
		return
    end
end)

RegisterNetEvent('traitementjusorange')
AddEventHandler('traitementjusorange', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    local orange = xPlayer.getInventoryItem('orange').count
    local jus_orange = xPlayer.getInventoryItem('jus_orange').count

    if jus_orange > 250 then
        TriggerClientEvent('esx:showNotification', source, '~r~Il semble que tu ne puisses plus porter de jus de orange...')
    elseif orange < 5 then
        TriggerClientEvent('esx:showNotification', source, '~r~Pas assez de jus de orange pour traiter...')
    else
        xPlayer.removeInventoryItem('orange', 5)
        xPlayer.addInventoryItem('jus_orange', 1)
    end
end)


RegisterServerEvent('selljusorange')
AddEventHandler('selljusorange', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
    local jus_orange = 0

	for i=1, #xPlayer.inventory, 1 do
		local item = xPlayer.inventory[i]

		if item.name == "jus_orange" then
			jus_orange = item.count
		end
	end
    
    
    if jus_orange > 0 then
        xPlayer.removeInventoryItem('jus_orange', 1)
        xPlayer.addMoney(120)
        TriggerClientEvent('esx:showNotification', xPlayer.source, "~g~Vous avez gagner ~b~120€~g~ pour chaque vente d'un jus de orange")
    else 
        TriggerClientEvent('esx:showNotification', xPlayer.source, "Vous n'avez plus rien à vendre")
    end
end)



