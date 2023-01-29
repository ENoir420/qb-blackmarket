local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem('darklaptop', function(source)
	local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemByName('vpn') then
    TriggerClientEvent('qb-blackmarket:Uselaptop', source)
    end
end)

RegisterNetEvent('qb-blackmarket:Buyitems', function (cd)
    local src = source 
	local Player = QBCore.Functions.GetPlayer(src)
    local item = cd.item
    local price = cd.price
    local soldisporchi = Player.Functions.GetItemByName("soldisporchi")
    local nomeItem = QBCore.Shared.Items[item]["label"]
    if soldisporchi ~= nil then
        if tonumber(soldisporchi.amount) >= tonumber(price) then
            Player.Functions.RemoveItem('soldisporchi', price)
            Player.Functions.AddItem(item, 1)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "add")
            TriggerClientEvent('QBCore:Notify', src, "Hai acquistato la sfaccim di " .. nomeItem .." fratm", 'success')
        else 
            TriggerClientEvent('QBCore:Notify', src, "Non hai abbastanza soldi", 'error')
        end
    else
        TriggerClientEvent('QBCore:Notify', src, "Non hai soldi", 'error')
    end
end)
