AddEventHandler("playerSpawned", function()
    TriggerServerEvent("misha:server:player:spawned")
end)

RegisterCommand('test', function(source, args, RawCommand)
    TriggerEvent("playerSpawned")
end)

RegisterNetEvent("misha:client:player:spawned", function(player, NewPlayer)
    if source == "" then
        return -- prevent mod menus
    end
end)

Citizen.CreateThread(function()
    while true do
        local c = vector3(-802.1342, 175.4140, 72.8446)
        local dist = #(GetEntityCoords(PlayerPedId()) - c) 

        if dist < 5 then
            DrawMarker(1, c, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 255, 0, 0, 100)
            
            if dist < 1.5 then
                exports.misha_interaction.interact("mashallah", "warning")
            end
        end

        Citizen.Wait(0)
    end
end)