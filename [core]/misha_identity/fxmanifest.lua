fx_version 'cerulean'
games { 'gta5' }
author 'Misha =)'
ui_page 'html/index.html'
client_scripts {
    "client/*.lua"
}   

server_scripts {
    "@oxmysql/lib/MySQL.lua",
    "server/*.lua"
}

shared_scripts {
    "@misha/core.lua"
}

files {
    'html/index.html',
    'html/script.js',
    'html/style.css'
}