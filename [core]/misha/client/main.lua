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

    if NewPlayer then
        if Misha.Identity.use then
            TriggerEvent("misha_identity:OpenRegisterMenu")
        else
            Misha.Identity.own()
        end
    end
end)