# Class: jenkins::sysconfig
#
define jenkins::sysconfig ( $value ) {
  $path = $::osfamily ? {
    RedHat  => '/etc/sysconfig',
    Debian  => '/etc/default',
    default => fail( "Unsupported OSFamily ${::osfamily}" )
  }

   # notify{"ik ben jaap sysconfig.pp, \"${path}/jenkins\" --- \"${name}=\"${value}\"":}

  file { "/etc/default/jenkins":
    ensure => present,
    content => template('jenkins/jenkins-default.erb'),
    notify  => Service[jenkins]
  }

  # file_line { "Jenkins sysconfig setting ${name}":
  #   line  => "${name}=\"${value}\"",
  #   path  => "${path}/jenkins",
  #   match => "^${name}=",
  #  } 
 }