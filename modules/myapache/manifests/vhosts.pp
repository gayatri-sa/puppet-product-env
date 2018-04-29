class myapache::vhosts {

  if $::osfamily == 'RedHat' {
    file { '/etc/httpd/conf.d/vhost.conf':
      ensure    => file,
      content   => template('myapache/vhosts-rh.conf.erb'),
    }
    file { "domain-folder":
      name      => "/var/www/$servername",
      ensure    => directory,
    }
    file { "public-folder":
      name      => "/var/www/$servername/public_html",
      ensure    => directory,
      require   => File["domain-folder"]
    }
    file { "log-folder":
      name      => "/var/www/$servername/log",
      ensure    => directory,
      require   => File["domain-folder"]
    }

  } elsif $::osfamily == 'Debian' {
    file { "/etc/apache2/sites-available/$servername.conf":
      ensure  => file,
      content  => template('myapache/vhosts-deb.conf.erb'),
    }
    file { "domain-folder":
      name      => "/var/www/html/$servername",
      ensure    => directory,
    }
    file { "public-folder":
      name      => "/var/www/html/$servername/public_html",
      ensure    => directory,
      require   => File["domain-folder"]
    }
    file { "log-folder": 
      name      => "/var/www/html/$servername/logs",
      ensure    => directory,
      require   => File["domain-folder"]
    }

  } else {
    fail("This is not a supported distro.")

  }

}
