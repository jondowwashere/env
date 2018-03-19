class emacs::uninstall {

    # uninstall emacs
    package { 'emacs24':
        ensure  => purged,
    }

}
