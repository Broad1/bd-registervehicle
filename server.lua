Config = {}
Debug = true
local QBCore = exports['qb-core']:GetCoreObject()
local player = QBCore.Functions.GetPlayer(source)


RegisterNetEvent("bdrv:ChargePlayerMoney", function ()
    local p = QBCore.Functions.GetPlayer(source)
    local src = source

    if Config.ChargePlayer then
        Player.Functions.RemoveMoney(bank, Config.Price, 'Registration at DMV')
    end
end)

RegisterServerEvent('bdrv:finishmenu')
AddEventHandler("bdrv:finishmenu", function (arg1, arg2)
    local player = QBCore.Functions.GetPlayer(source)
    local cid = player.PlayerData.citizenid
    local license = player.PlayerData.license
    local vehiclename = arg1
    local platenumber = arg2
    local vehicle = GetHashKey(vehiclename)
    

    if Debug then 
        print(vehiclename)
        print(platenumber)
        print(platenumber)
    end

    MySQL.insert.await('INSERT INTO `player_vehicles` (license, citizenid, vehicle, plate, mods, state, hash, garage) VALUES (?, ?, ?, ?, ?, ?, ?, ?)', {
        license,
        cid,
        vehiclename,
        platenumber,
        '{}',
        0,
        vehicle,
        'pillboxgarage',
    })


  
end)