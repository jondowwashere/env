node 'server.domain.ext' {
     include lamp
}

#node 'server.domain.ext' {
#    include lamp::uninstall
#}

node 'client.domain.ext' {
     include emacs
}

#node 'client.domain.ext' {
#     include emacs::uninstall
#}
