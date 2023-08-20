RegisterServerEvent("misha_identity:server:register:player", function(data)
    local identifier = Misha.GetIdentifier(source)
    MySQL.update.await('UPDATE players SET metadata = ? WHERE identifier = ?', {data, identifier})
end)