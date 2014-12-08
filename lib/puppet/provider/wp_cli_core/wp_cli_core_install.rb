require File.expand_path(File.join(File.dirname(__FILE__), 'wp_cli_core'))
Puppet::Type.type(:wp_cli_core_install).provide(:wp_cli_core, :parent => Puppet::Provider::Wpcli::Core) do
  desc 'Create the WordPress tables in the database.'
  commands :wp => 'wp'

  def install
    wp(['core', 'install', '--url', "#{@resource[:url]}", '--title', "#{@resource[:name]}", '--admin_user', "#{@resource[:admin_user]}", '--admin_password', "#{@resource[:admin_password]}", '--admin_email', "#{@resource[:admin_email]}"])
  end
end
