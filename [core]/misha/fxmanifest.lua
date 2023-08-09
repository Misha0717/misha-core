fx_version 'adamant'
games { 'gta5' }
author 'Misha =)'
client_scripts {
    "client/*.lua",
    "config.lua"
}

server_scripts {
    "server/*.lua",
    "config.lua"
}

shared_scripts {
    "@oxmysql/lib/MySQL.lua"
}