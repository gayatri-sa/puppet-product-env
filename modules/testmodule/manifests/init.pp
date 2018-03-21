# Class: testmodule
# ===========================
#
# Full description of class testmodule here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'testmodule':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Author Name <author@domain.com>
#
# Copyright
# ---------
#
# Copyright 2018 Your name here, unless otherwise noted.
#
$globalclass = "I am a global class variable"
class testmodule {

    exec { 'apt-update':
	command => '/usr/bin/apt-get update'
    }

    package { 'apache2':
	ensure => installed,
	require => Exec['apt-update']
    }

    service { 'apache2':
	ensure => running
    }

    package {'php5':
	require => Exec['apt-update'],
  	ensure => installed
    }

    package {'libapache2-mod-php5':
  	require => Exec['apt-update'],
  	ensure => installed
    }

    file {'/etc/apache2/mods-available/php5.conf':
  	content => '<IfModule mod_php5.c>
<FilesMatch "\.php$">
    SetHandler application/x-httpd-php
</FilesMatch>
</IfModule>',
 	require => Package['apache2'],
  	notify => Service['apache2']
     }

     file {'/var/www/html/i.php':
  	ensure => 'file',
  	content => '<?php phpinfo(); ?>,
  	require => Package['apache2']
     }
}
