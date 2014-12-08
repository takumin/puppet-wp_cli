# == Class wp_cli::service
#
# This class is meant to be called from wp_cli.
# It ensure the service is running.
#
class wp_cli::service {

  service { $::wp_cli::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
