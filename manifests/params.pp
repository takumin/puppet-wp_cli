# == Class wp_cli::params
#
# This class is meant to be called from wp_cli.
# It sets variables according to platform.
#
class wp_cli::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'wp_cli'
      $service_name = 'wp_cli'
    }
    'RedHat', 'Amazon': {
      $package_name = 'wp_cli'
      $service_name = 'wp_cli'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
