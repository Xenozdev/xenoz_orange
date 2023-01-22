

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(5000)
	end
end)

--- MENU ---

local open = false 
local mainMenu = RageUI.CreateMenu('~p~Ventes', '~p~orange')
mainMenu.Display.Header = true 
mainMenu.Closed = function()
  open = false
end

--- FUNCTION OPENMENU ---

function VentesMeca()
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

			RageUI.Button("Vendre Jus de orange", nil, {RightLabel = "~r~70€"}, true , {
				onSelected = function()
                    TriggerServerEvent('selljusorange')
				end
			}, subMenu)

		   end)
		Wait(0)
	   end
	end)
 end
end
		-------------------------------------------------------------------------------------------------------

local position = {
	{x = 1741.6726074219, y = 6419.9853515625, z = 35.042423248291}
}

Citizen.CreateThread(function()
    while true do

      local wait = 750

        for k in pairs(position) do
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, position[k].x, position[k].y, position[k].z)

            if dist <= 4.0 then
            wait = 0
			DrawMarker(22, 1741.6726074219, 6419.9853515625, 35.042423248291, 0.0, 0.0, 0.0, 0.0,0.0,0.0, 1.0, 1.0, 1.0, 136, 14, 79, 255, true, true, p19, true)   

        
            if dist <= 10.0 then
               wait = 0
                Visual.Subtitle("Appuyer sur ~b~[E]~s~ pour ~p~intéragir", 1) 
                if IsControlJustPressed(1,51) then
					VentesMeca()
            end
        end
    end
    end
    Citizen.Wait(wait)
    end
end)
