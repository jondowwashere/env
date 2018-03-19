class lamp::install {

    # install apache2
    package {'apache2':
        ensure  => installed,
    }

    # run apache2
    service {'apache2':
        require => Package['apache2'],
        ensure  => running,
    }

    # install mysql
    package {'mysql-server':
        ensure  => installed,
    }

    # run mysql
    service {'mysql':
        require => Package['mysql-server'],
        ensure  => running,
    }

    # install php5
    package {'php5':
        ensure  => installed,
    }

    # install libapache2-mod-php5
    package {'libapache2-mod-php5':
        ensure  => installed,
    }

    # configure info.php file
    file {'/var/www/html/info.php':
        require => Package['apache2'],
        ensure  => file,
        content => '<?php phpinfo();?>',
    }

}
