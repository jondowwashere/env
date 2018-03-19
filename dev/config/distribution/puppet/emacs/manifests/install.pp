class emacs::install {

    # install emacs
    package { 'emacs24':
        ensure => installed,
    }

}
