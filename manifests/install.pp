# == Class wp_cli::install
#
# This class is called from wp_cli for install.
#
class wp_cli::install {

  package { $::wp_cli::package_name:
    ensure => present,
  }
}
