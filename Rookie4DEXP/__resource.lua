resource_manifest_version '77731fab-63ca-442c-a67b-abc70f28dfa5'
description 'Experience'
ui_page 'html/levelhud.html'
client_script {

    'rookieplayer/client.lua'

}
server_script {
    '@mysql-async/lib/MySQL.lua',
    'rookieserver/server.lua'
}
dependency 'es_extended'

files {
    'html/levelhud.html',
    'html/style.css',
    'html/reset.css',
    'html/listener.js',
}