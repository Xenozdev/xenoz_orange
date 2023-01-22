Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(5000)
	end
end)

--- Récolte de boulont ---

local mainMenu = RageUI.CreateMenu('~p~Récolte', '~p~orange')

function OpenMenuRecolte()
	if open then 
		open = false
		RageUI.Visible(mainMenu, false)
		return
	else
		open = true 
		RageUI.Visible(mainMenu, true)
		CreateThread(function()
		while open do 
			RageUI.IsVisible(mainMenu,function() 

			RageUI.Button("Commencer la Récolte", nil, {RightLabel = "→"}, true , {
				onSelected = function()
					FreezeEntityPosition(PlayerPedId(), true)
					StartRecolte()
				end
			})

			RageUI.Button("Stopper la Récolte", nil, {RightLabel = "→"}, true , {
				onSelected = function()
					FreezeEntityPosition(PlayerPedId(), false)
					StopRecolte()
				end
			})

			end)
		Wait(0)
		end
	end)
  	end
end

--- FUNCTION RECOLTE ---
function StopRecolte()
    if recoltepossible then
    	recoltepossible = false
    end
end

function StartRecolte()
    if not recoltepossible then
        recoltepossible = true
    while recoltepossible do
        Citizen.Wait(2000)
        TriggerServerEvent('recolteorange')
    end
    else
        recoltepossible = false
    end
end

----OUVRIR LE MENU------------

local position = {
	{x = 2373.1101074219, y = 4735.4223632813, z = 33.802375793457}
}

Citizen.CreateThread(function()
    while true do

      local wait = 750

        for k in pairs(position) do
        
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, position[k].x, position[k].y, position[k].z)

            if dist <= 4.0 then
            wait = 0
            DrawMarker(22, 2373.1101074219, 4735.4223632813, 33.802375793457, 0.0, 0.0, 0.0, 0.0,0.0,0.0, 0.3, 0.3, 0.3, 136, 14, 79, 255, true, true, p19, true)  

        
            if dist <= 10.0 then
               wait = 0
                Visual.Subtitle("Appuyer sur ~b~[E]~s~ pour ~p~récolter", 1) 
                if IsControlJustPressed(1,51) then
					OpenMenuRecolte()
            end
        end
    end
    end
    Citizen.Wait(wait)
    end

end)

--- Traitement des boulont ---

local mainMenu = RageUI.CreateMenu('~p~Traitement', '~p~orange')

function OpenMenuTraitement()
	if open then 
		open = false
		RageUI.Visible(mainMenu, false)
		return
	else
		open = true 
		RageUI.Visible(mainMenu, true)
		CreateThread(function()
		while open do 
			RageUI.IsVisible(mainMenu,function() 

			RageUI.Button("Commencer le Traitement", nil, {RightLabel = "→"}, true , {
				onSelected = function()
					FreezeEntityPosition(PlayerPedId(), true)
					StartTraitement()
				end
			})

			RageUI.Button("Stopper le Traitement", nil, {RightLabel = "→"}, true , {
				onSelected = function()
					FreezeEntityPosition(PlayerPedId(), false)
					StopTraitement()
				end
			})

			end)
		Wait(0)
		end
	end)
  	end
end

--- FUNCTION RECOLTE ---

function StopTraitement()
    if traitementpossible then
    	traitementpossible = false
    end
end

function StartTraitement()
    if not traitementpossible then
        traitementpossible = true
    while traitementpossible do
            Citizen.Wait(2000)
            TriggerServerEvent('traitementjusorange')
    end
    else
        traitementpossible = false
    end
end

----OUVRIR LE MENU------------

local position = {
	{x = 2304.7004394531, y = 4756.775390625, z = 37.244220733643}  
}

Citizen.CreateThread(function()
    while true do

      local wait = 750

        for k in pairs(position) do
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, position[k].x, position[k].y, position[k].z)

            if dist <= 4.0 then
            wait = 0
            DrawMarker(22, 2304.7004394531, 4756.775390625, 37.244220733643, 0.0, 0.0, 0.0, 0.0,0.0,0.0, 0.3, 0.3, 0.3, 136, 14, 79, 255, true, true, p19, true)  

        
            if dist <= 10.0 then
               wait = 0
                Visual.Subtitle("Appuyer sur ~b~[E]~s~ pour ~p~traiter", 1) 
                if IsControlJustPressed(1,51) then
					OpenMenuTraitement()
            end
        end
    end
    end
    Citizen.Wait(wait)
    end

end)


local blips = {

	{title="Recolte de orange", colour=0, id=1,  x = 2373.1101074219, y = 4735.4223632813, z = 33.802375793457},
	{title="Traitement de orange", colour=0, id=1,  x = 2304.7004394531, y = 4756.775390625, z = 37.244220733643},
	{title="Vente de orange", colour=0, id=1,  x = 1741.6726074219, y = 6419.9853515625, z = 35.042423248291}
 }

Citizen.CreateThread(function()

	 recolteorange = AddBlipForCoord(2373.1101074219, 4735.4223632813, 33.802375793457)
	 SetBlipSprite(recolteorange, 1)
	 SetBlipScale(recolteorange, 1.0)
	 SetBlipColour(recolteorange, 1)
	 SetBlipAsShortRange(recolteorange, true)
	 BeginTextCommandSetBlipName("STRING")
	 AddTextComponentString("Recolte de orange")
	 EndTextCommandSetBlipName(recolteorange)
   end)
  
Citizen.CreateThread(function()

	 traitementorange = AddBlipForCoord(2304.7004394531, 4756.775390625, 37.244220733643)
	 SetBlipSprite(traitementorange, 1)
	 SetBlipScale(traitementorange, 1.0)
	 SetBlipColour(traitementorange, 1)
	 SetBlipAsShortRange(traitementorange, true)
	 BeginTextCommandSetBlipName("STRING")
	 AddTextComponentString("Traitement de orange")
	 EndTextCommandSetBlipName(traitementorange)
   end)

Citizen.CreateThread(function()

	 venteorange = AddBlipForCoord(1741.6726074219, 6419.9853515625, 35.042423248291)
	 SetBlipSprite(venteorange, 1)
	 SetBlipScale(venteorange, 1.0)
	 SetBlipColour(venteorange, 1)
	 SetBlipAsShortRange(venteorange, true)
	 BeginTextCommandSetBlipName("STRING")
	 AddTextComponentString("Vente de orange")
	 EndTextCommandSetBlipName(venteorange)
   end)

