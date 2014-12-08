require File.expand_path(File.join(File.dirname(__FILE__), '..', 'wp_cli'))
Puppet::Type.type(:wp_cli_core).provide(:wp_cli, :parent => Puppet::Provider::Wpcli) do
  desc 'Download, install, update and otherwise manage WordPress proper.'
end
