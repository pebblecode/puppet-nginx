# == Class: nginx
#
# Installs and starts Nginx. Writes proxy settings to a file and sets the
# default configuration for nginx.
#
# === Parameters
#
# none
#
# === Variables
# 
# none
#
# === Examples
#
# include nginx
#  
# === Authors
#
# Author Name <george@shapeshed.com>
#
# === Copyright
#
# Copyright 2012 George Ornbo, unless otherwise noted.
#
class nginx {
  package { "nginx":
    ensure => present
  }
  file { "/etc/nginx/nginx.conf":
    owner   => root,
    group   => root,
    mode    => 644,
    source  => "puppet:///modules/nginx/nginx.conf",
    require => Package["nginx"],
  }
  file { "/etc/nginx/conf.d/proxy.conf":
    owner   => root,
    group   => root,
    mode    => 644,
    source  => "puppet:///modules/nginx/proxy.conf",
    require => Package["nginx"],
  }
  service { "nginx":
    ensure => running,
    enable => true,
    hasstatus => true,
    hasrestart => true,
    require => Package["nginx"],
  }
}
