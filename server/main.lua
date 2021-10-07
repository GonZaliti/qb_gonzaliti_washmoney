QBCore = nil

TriggerEvent("QBCore:GetObject", function(library) 
	QBCore = library 
end)

local Lista = {
    ["markedbills"] = "markedbills"
}

RegisterServerEvent('gonzaliti:server:entregar')
AddEventHandler('gonzaliti:server:entregar', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local dinero = Player.Functions.GetItemByName('markedbills')

    if Player.PlayerData.items ~= nil then 
        for k, v in pairs(Player.PlayerData.items) do 
            if dinero ~= nil then
                if Lista[Player.PlayerData.items[k].name] ~= nil then
                    if Player.PlayerData.items[k].amount >= 1 then 
                        local amount = Player.PlayerData.items[k].amount * 0.8
                        TriggerClientEvent('QBCore:Notify', source, "Has dado "..Player.PlayerData.items[k].amount.." y te han dado "..amount.."€")

                        Player.Functions.RemoveItem("markedbills", Player.PlayerData.items[k].amount)
                        Player.Functions.AddMoney("cash", amount)
                        break
                    else
                        TriggerClientEvent('QBCore:Notify', src, "No tienes nada que entregarme", 'error')
                        break
                    end
                end
            else
                TriggerClientEvent('QBCore:Notify', src, "No tienes nada que entregarme", 'error')
                break
            end
        end
    end
end)


