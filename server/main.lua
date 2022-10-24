-- 
--   ____      __  __      _____     ___   _ 
--   |  _ \  ___\ \/ /___  / _ \ \   / / | | |
--   | | | |/ _ \\  // _ \| | | \ \ / /| |_| |
--   | |_| |  __//  \ (_) | |_| |\ V / |  _  |
--   |____/ \___/_/\_\___(_)___/  \_/  |_| |_|
--                                            
--  

local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRPRAR = {}
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","dexo_rar")
Tunnel.bindInterface("dexo_rar", vRPRAR)

local cfg = module("dexo_rar", "config")

RegisterNetEvent('checkcardeplatexo:dexo')
AddEventHandler("checkcardeplatexo:dexo", function(plate)
    -- how to check the plate in the database?

    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    exports.oxmysql:execute("SELECT * FROM vrp_user_vehicles", {}, function(theVehicles)
        for k,v in pairs(theVehicles) do
            NumarDeImatriculare = tostring(v.vehicle_plate)
            ModelDeMasina = tostring(v.numeveh)
            PretMasina = tostring(v.pret)
            EsteVip = tostring(v.isVipVeh)
            EsteDeFactiune = tostring(v.faction)
            
            if NumarDeImatriculare == plate then
                vRPclient.notify(player, {"Succes: Am gasit acest vehicul."})
                TriggerClientEvent("changehtml:dexo", player, "Numar de inmatriculare: "..NumarDeImatriculare.."<br>Model: "..ModelDeMasina.."<br>Proprietar: #"..user_id.."<br>Pret: "..PretMasina.."<br>Vip: "..EsteVip.." ( 1 = Da, 0 = Nu )<br>Factine: "..EsteDeFactiune.."")
                return
            end
        end
        vRPclient.notify(player, {"Info: ~r~Nu am gasit numarul de inmatriculare"})
    end)
end)