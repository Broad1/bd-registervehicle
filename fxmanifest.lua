fx_version 'cerulean'
game 'gta5'
lua54 'yes'

name 'bd-registervehicle'
author 'broad.' -- optional 
description ''
version '1.0' -- optional 

client_scripts { 
   'client.lua'
}

server_scripts { 
    'server.lua',
    '@oxmysql/lib/MySQL.lua',

}

shared_scripts {
  '@ox_lib/init.lua',
}

files {
    '*.*',
}

escrow_ignore {

}

dependencies { 

}