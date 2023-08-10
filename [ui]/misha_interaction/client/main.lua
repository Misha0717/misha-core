local Data = {
    Open = false,
    Time = 0
}

exports("interact", function(msg, type)
    if not Data.Open then 
        Data.Open = true
        SendNUIMessage({
            open = true,
            message = msg,
            type = type
        })
    else
        Data.Time = GetGameTimer()
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(250)

        if Data.Open then
            if GetGameTimer() - Data.Time > 100 then
                Data.Time = 0
                Data.Open = false

                SendNUIMessage({
                    open = false,
                })
            end
        end
    end
end)