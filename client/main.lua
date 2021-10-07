QBCore = nil

Citizen.CreateThread(function()
	while QBCore == nil do
		TriggerEvent("QBCore:GetObject", function(library) 
			QBCore = library 
		end)
		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)

        local pj = PlayerPedId()
        local pos = GetEntityCoords(pj)

        if #(pos - Config['main']['coords']) < 2 then
            QBCore.Functions.HelpNotify("[E] Lavar dinero")

            if IsControlJustPressed(0, 38) then
                TriggerServerEvent("gonzaliti:server:entregar")
            end
        end
    end
end)

Citizen.CreateThread(function()
    ped = CreatePed(4, GetHashKey(Config['main']['pedmodel']), Config['main']['xped'], Config['main']['yped'], Config['main']['zped'], Config['main']['hped'], false, true)
    FreezeEntityPosition(ped, true)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
end)