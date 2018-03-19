class lamp::uninstall {

    # uninstall apache2
    package { 'apache2':
        ensure  => purged,
    }

    # uninstall mysql
    package { 'mysql-server':
        ensure  => purged,
    }

    # uninstall php5
    package { 'php5':
        ensure  => purged,
    }

    # uninstall libapache2-mod-php5
    package { 'libapache2-mod-php5':
        ensure  => purged,
    }

    # configure info.php file
    file { '/var/www/html/info.php':
        ensure  => absent,
    }

}
