MishaPlayers = {}
local Misha = {}

function Misha.GetIdentifier(source)
    if MishaPlayers[source] then
        return
    end
    
    return MishaPlayers[source].identifier
end