class myapache::params {
if $::osfamily == 'RedHat' {
    $apachename     = 'httpd'
    $conffile       = '/etc/httpd/conf/httpd.conf'
    $confsource     = 'puppet:///modules/myapache/httpd.conf'
  } elsif $::osfamily == 'Debian' {
    $apachename     = 'apache2'
    $conffile       = '/etc/apache2/apache2.conf'
    $confsource     = 'puppet:///modules/myapache/apache2.conf'
  } else {
    fail('This is not a supported distro.')
  }
}
