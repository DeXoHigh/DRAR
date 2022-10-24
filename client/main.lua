-- 
--   ____      __  __      _____     ___   _ 
--   |  _ \  ___\ \/ /___  / _ \ \   / / | | |
--   | | | |/ _ \\  // _ \| | | \ \ / /| |_| |
--   | |_| |  __//  \ (_) | |_| |\ V / |  _  |
--   |____/ \___/_/\_\___(_)___/  \_/  |_| |_|
--                                            
--  

local display = false

Citizen.CreateThread(function ()
while true do
    Citizen.Wait(1)
        if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), config.spawnmarker, true) < 2 then
            DrawMarker(36, config.spawnmarker[1],config.spawnmarker[2],config.spawnmarker[3]-0.1, 0, 0, 0, 0, 0, 0, 0.7, 0.7, 0.7, 0, 102, 255, 150, 0, 0, 0, 1)
            if (IsControlJustReleased(1, 51)) then
                SetDisplay(not display)
                StartScreenEffect('MenuMGIn', 1, true)
            end
        end
    end
end)

RegisterNUICallback("exit", function(data)
    SetDisplay(false)
    StopScreenEffect('MenuMGIn')
end)

RegisterNUICallback("dexoapasapebuton", function(data)
    TriggerServerEvent('checkcardeplatexo:dexo', data.id)
end)

RegisterNetEvent("changehtml:dexo")
AddEventHandler("changehtml:dexo", function(info)
    SendNUIMessage({
        type = "changehtm",
        text = info
    })
end)

function SetDisplay(bool)
    display = bool
    SetNuiFocus(bool, bool)
    SendNUIMessage({
        type = "ui",
        status = bool,
    })
end