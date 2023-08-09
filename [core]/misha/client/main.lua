AddEventHandler("playerSpawned", function()
    TriggerServerEvent("misha:server:player:spawned")
end)

RegisterCommand('test', function(source, args, RawCommand)
    TriggerEvent("playerSpawned")
end)