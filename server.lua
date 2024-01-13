Config = {}

Debug = true
local QBCore = exports['qb-core']:GetCoreObject()
local p = QBCore.Functions.GetPlayer(source)
local pf = p.Functions

RegisterNetEvent("bdrv:ChargePlayerMoney", function ()
    local p = QBCore.Functions.GetPlayer(source)
    local src = source

    if Config.ChargePlayer then
        Player.Functions.RemoveMoney('bank', Config.Price, 'Registration at DMV')
    end
end)

RegisterServerEvent('bdrv:finishmenu')
AddEventHandler("bdrv:finishmenu", function (arg1, arg2)
    local player = QBCore.Functions.GetPlayer(source)
    local cid = player.PlayerData.citizenid
    local license = player.PlayerData.license
    local vehiclename = arg1
    local platenumber = arg2
    local mods = "{}"
    local hash = 108773431

    if Debug then 
        print(vehiclename)
        print(platenumber)
        print(platenumber)
    end

if Config.QB then
    MySQL.insert.await('INSERT INTO `player_vehicles` (license, citizenid, vehicle, plate, mods, state, hash) VALUES (?, ?, ?, ?, ?, ?, ?)', {
        license,
        cid,
        vehiclename,
        platenumber,
        mods,
        0,
        hash
    })

    
elseif Config.ESX then return
elseif Config.Standalone then return
end
  
end)