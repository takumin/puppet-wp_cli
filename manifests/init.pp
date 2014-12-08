# == Class: wp_cli
#
# Full description of class wp_cli here.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
class wp_cli (
  $package_name = $::wp_cli::params::package_name,
  $service_name = $::wp_cli::params::service_name,
) inherits ::wp_cli::params {

  # validate parameters here
  wp_cli::core::install {
    'Wordpress':
      url            => "http://${::ipaddress}",
      admin_user     => 'admin',
      admin_password => 'admin',
      admin_email    => "admin@${::domain}",
  }

  class { '::wp_cli::install': } ->
  class { '::wp_cli::config': } ~>
  class { '::wp_cli::service': } ->
  Class['::wp_cli']
}
