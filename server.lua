
local QBCore = exports['qb-core']:GetCoreObject()


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

if Config.CustomAdditions == "bkrp" then
    RegisterServerEvent("bdrv:CustomAdditions:bkrp_pubcop_setjob", function ()
        local player = QBCore.Functions.GetPlayer(source)
        local pjob = player.PlayerData.job.name

        if Config.Debug then
            print("Player's Job is " .. pjob)
        end
      
        if pjob  == "pubcop" then
            return
        else 
            player.Functions.SetJob("pubcop", 1)
        end

        

    end)

end