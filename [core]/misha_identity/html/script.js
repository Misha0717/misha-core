let SelectedSex = null

window.addEventListener("message", function(event) {
    if (event.data.type == "OpenMenu") {
        OpenMenu()
    } else if (event.data.type == "error") {
        ShowError(event.data.class, event.data.msg)
    } else if (event.data.type == "CloseMenu") {
        CloseMenu()
    }
})

function CloseMenu() {
    $("body").fadeOut(1500)
}

function OpenMenu() {
    $("body").fadeIn(1500)
}

function SelectSex(sex) {
    const element = document.querySelector("." + sex)

    if (sex != "sex-male" && document.querySelector(".sex-male").style.backgroundColor == "rgb(250, 213, 213)") {
        document.querySelector(".sex-male").attributeStyleMap.clear()
    } else if (sex != "sex-female" && document.querySelector(".sex-female").style.backgroundColor == "rgb(250, 213, 213)") {
        document.querySelector(".sex-female").attributeStyleMap.clear()
    } else if (SelectedSex == sex.replace("sex-", "")) {
        element.attributeStyleMap.clear()
        SelectedSex = null
        return
    }

    element.style.backgroundColor = "rgb(250, 213, 213)"
    SelectedSex = sex.replace("sex-", "")
}

function Register() {
    const firstname = $(".firstname").val()
    const lastname = $(".lastname").val()
    const dateofbirth =  $(".dateofbirth").val()
    const sex = SelectedSex
    const height = $(".height").val()

    if (firstname == "") {
        ShowError("firstname", "Enter a valid firstname!")
        return
    } else if (lastname == "") {
        ShowError("lastname", "Enter a valid lastname!")
        return
    } else if (!IsDateValid(dateofbirth)) {
        ShowError("dateofbirth", "Enter a valid date!")
        return
    } else if (!IsHeightValid(height)) {
        ShowError("height", "Enter a valid height!")
        return
    } else if (!SelectedSex) {
        return
    }

    $.post(`https://${GetParentResourceName()}/register`, JSON.stringify({
        firstname: firstname,
        lastname: lastname,
        dateofbirth: dateofbirth,
        sex: sex,
        height: height
    }))
}

function ShowError(_class, msg) {
    const element = document.querySelector("." + _class)

    element.style.backgroundColor = "red"
    element.placeholder = msg
}

function Reset(_element) {
    const element = document.querySelector(_element)

    element.attributeStyleMap.clear()
}

function IsDateValid(date) {
    date = Number(date.replace(/[^a-zA-Z0-9 ]/g, ''))

    if (isNaN(date)) {
        return false
    }

    return true
}

function IsHeightValid(height) {
    if (height < 60 || height > 200) {
        return false
    }

    return true
}