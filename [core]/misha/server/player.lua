RegisterServerEvent("misha:server:player:spawned", function()
    local source = source
    local identifier = GetPlayerIdentifier(source, 0):gsub("steam:", "")
    local NewPlayer = MySQL.query.await('SELECT * FROM players WHERE `identifier` = ? LIMIT 1', {identifier})
    local newPlayer = false
    
    print(("^2[INFO] ^3%s^0 spawned into the server."):format(GetPlayerName(source)))
    if NewPlayer[1] == nil then
        newPlayer = true
        local accounts = {}
        accounts["bank"] = Misha.StartersMoney.bank
        accounts["cash"] = Misha.StartersMoney.cash
        accounts["blackmoney"] = Misha.StartersMoney.blackmoney

        MySQL.insert.await('INSERT INTO `players` (identifier, accounts) VALUES (?, ?)', { identifier, json.encode(accounts)})
    end

    MishaPlayers[source] = NewPlayer
    TriggerClientEvent("misha:client:player:spawned", source, NewPlayer, newPlayer)
end)