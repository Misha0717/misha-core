RegisterServerEvent("misha:server:player:spawned", function()
    local source = source
    local NewPlayer = false

    print(("^2[INFO] ^3%s^0 joined the server."):format(GetPlayerName(source)))
    TriggerClientEvent("misha:client:player:spawned", source, NewPlayer)
end)