require 'spec_helper'

describe 'wp_cli' do
  context 'supported operating systems' do
    ['Debian', 'RedHat'].each do |osfamily|
      describe "wp_cli class without any parameters on #{osfamily}" do
        let(:params) {{ }}
        let(:facts) {{
          :osfamily => osfamily,
        }}

        it { should compile.with_all_deps }

        it { should contain_class('wp_cli::params') }
        it { should contain_class('wp_cli::install').that_comes_before('wp_cli::config') }
        it { should contain_class('wp_cli::config') }
        it { should contain_class('wp_cli::service').that_subscribes_to('wp_cli::config') }

        it { should contain_service('wp_cli') }
        it { should contain_package('wp_cli').with_ensure('present') }
      end
    end
  end

  context 'unsupported operating system' do
    describe 'wp_cli class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
      }}

      it { expect { should contain_package('wp_cli') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
