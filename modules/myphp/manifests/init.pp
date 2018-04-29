class myphp {

  #$phpname = $osfamily ? {
  #  'Debian'    => 'php5',
  #  'RedHat'    => 'php',
  #  default     => warning('This distribution is not supported by the PHP module'),
  #}

  package { 'php':
    name: $phpname,
    ensure: present,
  }

  package { 'php-pear':
    ensure: present,
    require => Package['php'],
  }

  service { 'php-service':
    name    => $phpname,
    ensure  => running,
    enable  => true,
    require => Package['php-pear'],
  }

}
