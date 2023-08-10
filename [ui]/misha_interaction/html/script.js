window.addEventListener("message", function(event) {
    if (event.data.open) {
        ShowInteraction(event.data.message, event.data.type)
    } else {
        CloseInteraction()
    }
})

function CloseInteraction() {
    $(".display").animate({left: '400px'}, 'slow')
    setTimeout(() => {
        $(".display").hide()
    }, 2000);
}

function ShowInteraction(msg, style) {
    const element = document.querySelector(".display")
    const color = GetColorFromInput(style)

    element.style.backgroundColor = color
    element.innerText = msg
    $(".display").show()
    $(".display").animate({left: '-30px'}, 'slow')
}

function GetColorFromInput(style) {
    if (style == "success") {
        return "rgb(119, 199, 0)"
    } else if (style == "error") {
        return "rgb(255, 0, 0)"
    } else if (style == "warning") {
        return "orange"
    } 

    return "white"
}