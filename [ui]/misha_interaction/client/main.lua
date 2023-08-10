exports("interact", function(msg, type)
    SendNUIMessage({
        open = true,
        messsage = msg,
        type = type
    })
end)