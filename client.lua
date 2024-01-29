


if not Config.CustomAdditions then 
    for _, loc  in ipairs(Config.Locations) do
        CreateThread(function()
            local model = "s_m_m_fiboffice_01"
            RequestModel(Config.Model)
            while not HasModelLoaded(Config.Model) do
                Wait(0)
            end
            local entity = CreatePed(0, Config.Model, loc.x, loc.y, loc.z - 1, loc.w, false, false)
            FreezeEntityPosition(entity, true)
            SetEntityInvincible(entity, true)
            SetEntityCollision(entity, true, false)
            exports['qb-target']:AddTargetEntity(entity, {
                options = {
                    {
                        num = 1,
                        icon = 'fa-solid fa-car',
                        label = 'Register Your Vehicle',
                        action = function()
                            local DMVRegister = lib.inputDialog('Department Of Motor Vehicles', {'Spawn Code of Vehicle', 'License Plate Number', 'Driver License Name'})
     
                        
    
                            if not DMVRegister then return end
                            if debug then
                                print(json.encode(DMVRegister), DMVRegister[1], DMVRegister[2], DMVRegister[3])
                            end
                            vehiclename = DMVRegister[1]
                            platenumber = DMVRegister[2]
    
                            TriggerServerEvent('bdrv:finishmenu', vehiclename, platenumber)
           
                                TriggerServerEvent("bdrv:ChargePlayerMoney")
                     
                        end,
                    },
                 
                },
                distance = 2,
            })
        end)
    end
elseif Config.CustomAdditions == "bkrp" then
    for _, loc  in ipairs(Config.Locations) do
        CreateThread(function()
            local model = "s_m_m_fiboffice_01"
            RequestModel(Config.Model)
            while not HasModelLoaded(Config.Model) do
                Wait(0)
            end
            local entity = CreatePed(0, Config.Model, loc.x, loc.y, loc.z - 1, loc.w, false, false)
            FreezeEntityPosition(entity, true)
            SetEntityInvincible(entity, true)
            SetEntityCollision(entity, true, false)
            exports['qb-target']:AddTargetEntity(entity, {
                options = {
                    {
                        num = 1,
                        icon = 'fa-solid fa-car',
                        label = 'Register Your Vehicle',
                        action = function()
                            local DMVRegister = lib.inputDialog('Department Of Motor Vehicles', {'Spawn Code of Vehicle', 'License Plate Number', 'Driver License Name'})
     
                        
    
                            if not DMVRegister then return end
                            if debug then
                                print(json.encode(DMVRegister), DMVRegister[1], DMVRegister[2], DMVRegister[3])
                            end
                            vehiclename = DMVRegister[1]
                            platenumber = DMVRegister[2]
    
                            TriggerServerEvent('bdrv:finishmenu', vehiclename, platenumber)
           
                                TriggerServerEvent("bdrv:ChargePlayerMoney")
                     
                        end,
                    },
                    {
                        num = 2,
                        icon = 'fa-solid fa-handcuffs',
                        label = 'Become a PubCop today!',
                        type = "server",
                        event = "bdrv:CustomAdditions:bkrp_pubcop_setjob",
                    }
                },
                distance = 2,
            })
        end)
    end
end

 





