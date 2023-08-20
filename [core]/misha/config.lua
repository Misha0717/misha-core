Misha = {}

Misha.SpawnLocation = vector4(-1612.2826, 185.3595, 59.7648, 19.2685)
Misha.StartersMoney = {
    bank = 50000,
    cash = 0,
    blackmoney = 0
}

Misha.Identity = {
    use = true, -- use the misha_identity
    own = function()
        TriggerEvent("your_own_identity") -- use here you own identity event
    end
}