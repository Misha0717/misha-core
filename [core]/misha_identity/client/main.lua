AddEventHandler("misha_identity:OpenRegisterMenu", function()
    SendNUIMessage({
        type = "OpenMenu"
    })
    SetNuiFocus(true, true)
    TriggerScreenblurFadeIn(0)
end)

RegisterNUICallback("register", function(data)
    if not IsDateValid(data.dateofbirth) then
        SendNUIMessage({
            type = "error",
            class = "dateofbirth",
            msg = "Enter a valid date!"
        })
        return
    end

    SendNUIMessage({
        type = "CloseMenu"
    })
    SetNuiFocus(false, false)
    TriggerScreenblurFadeOut(4)
    TriggerServerEvent("misha_identity:server:register:player", data)
end)

function IsDateValid(str)
    local d, m, y = str:match("(%d+)-(%d+)-(%d+)")
  
    d, m, y = tonumber(d), tonumber(m), tonumber(y)
    
    if d == nil or m == nil or y == nil then
        return false
    else
        if d < 0 or d > 31 or m < 0 or m > 12 or y < 1900 then
            return false
        elseif m == 4 or m == 6 or m == 9 or m == 11 then 
            return d <= 30
        elseif m == 2 then
            if y%400 == 0 or (y%100 ~= 0 and y%4 == 0) then
                return d <= 29
            else
                return d <= 28
            end
        else 
            return d <= 31
        end
    end
end