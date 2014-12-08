Puppet::Type.newtype(:wp_cli_core_install) do
  @doc = 'Create the WordPress tables in the database.'

  ensurable

  newparam(:name, :namevar => true) do
    desc 'The title of the new site.'
  end

  newproperty(:url) do
    desc 'The address of the new site.'
  end

  newproperty(:admin_user) do
    desc 'The name of the admin user.'
  end

  newproperty(:admin_password) do
    desc 'The password for the admin user.'
  end

  newproperty(:admin_email) do
    desc 'The email address for the admin user.'
  end
end
