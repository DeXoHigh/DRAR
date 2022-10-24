fx_version 'adamant'
game 'gta5'

author 'DeXo'
description 'Rent Pines'
version '0.1'

files {
    'html/index.html',
    'html/index.js',
    'html/index.css',
    'html/reset.css'
}

ui_page "html/index.html"

server_scripts {
	'@vrp/lib/utils.lua',
    "server/*.lua"
}

shared_script 'config.lua'

client_scripts {
	'lib/Proxy.lua', 'lib/Tunnel.lua',
    "client/*.lua"
}