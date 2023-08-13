fx_version 'adamant'
games { 'gta5' }
author 'Misha =)'
client_scripts {
    "client/*.lua",
    "config.lua"
}

server_scripts {
    "@oxmysql/lib/MySQL.lua",
    "server/*.lua",
    "config.lua"
}