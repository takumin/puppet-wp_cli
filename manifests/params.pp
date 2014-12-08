# == Class wp_cli::params
#
# This class is meant to be called from wp_cli.
# It sets variables according to platform.
#
class wp_cli::params {
  case $::osfamily {
    'Debian', 'RedHat', 'Amazon': {
      $package_name = 'wp-cli'
    }
    'FreeBSD': {
      $package_name = 'www/php-wp-cli'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
