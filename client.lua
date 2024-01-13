
debug = Config.Debug
Enabled = Config.Enabled



if Enabled then
    for k, loc  in ipairs(Config.Locations) do
        CreateThread(function()
            local model = "a_m_m_indian_01"
            RequestModel(model)
            while not HasModelLoaded(model) do
                Wait(0)
            end
            local entity = CreatePed(0, model, loc.x, loc.y, loc.z, loc.h, false, false)
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
                            if Config.QB then
                                TriggerServerEvent("bdrv:ChargePlayerMoney")
                            end
                        end,
                    }
                },
                distance = 1,
            })
        end)
    end
end




