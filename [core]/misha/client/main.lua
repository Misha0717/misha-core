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
        DoScreenFadeOut(500)

        while not IsScreenFadedOut() do
            Wait(50)
        end

        Wait(2000)
        local ped = PlayerPedId()

        SetEntityCoords(ped, Misha.SpawnLocation.x, Misha.SpawnLocation.y, Misha.SpawnLocation.z)
        SetEntityHeading(ped, Misha.SpawnLocation.w)

        DoScreenFadeIn(500)

        if Misha.Identity.use then
            TriggerEvent("misha_identity:OpenRegisterMenu")
        else
            Misha.Identity.own()
        end
    end
end)