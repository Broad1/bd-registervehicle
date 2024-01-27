

Locations = {
    vector4(-435.21, 1097.85, 329.77, 330),
    vector4(1817.86, 3673.83, 34.71, 115),
    vector4(2825.16, 4730.58, 48.63, 279),
    vector4(1542.72, 816.13, 77.66, 61),
    vector4(-379.16, -355.52, 31.65, 193),
    vector4(-51.27, -1107.49, 26.44, 174)
}


    for k, loc  in ipairs(Locations) do
        CreateThread(function()
            local model = "s_m_m_fiboffice_01"
            RequestModel(model)
            while not HasModelLoaded(model) do
                Wait(0)
            end
            local entity = CreatePed(0, model, loc.x, loc.y, loc.z - 1, loc.w, false, false)
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
                    }
                },
                distance = 2,
            })
        end)
    end





