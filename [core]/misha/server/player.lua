RegisterServerEvent("misha:server:player:spawned", function()
    local source = source
    local identifier = GetPlayerIdentifier(source, 0):gsub("steam:", "")
    local NewPlayer = MySQL.query.await('SELECT * FROM players WHERE `identifier` = ?', {identifier})

    print(("^2[INFO] ^3%s^0 joined the server."):format(GetPlayerName(source)))
    TriggerClientEvent("misha:client:player:spawned", source, NewPlayer, NewPlayer[1] == nil)
end)