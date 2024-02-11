fx_version 'cerulean'
game 'rdr3'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

author 'DocTheMedic'
description 'A collection of small resources'
version '1.0.0'

client_script {
    'client/geodeopening_cl.lua',
    'client/organharvest_cl.lua'
}
server_script {
    'server/organharvest_sv.lua',
    'server/geodeopening_sv.lua',
    'server/cigarettecards.lua',
    'server/TWIUsableItems.lua',
    'server/twiGrinder.lua',
    'server/twiCollection.lua'
}
