require 'spec_helper'

describe 'foo::linux' do
  context 'When all attributes are default, on Ubuntu' do
    let(:chef_run_ubuntu) do
      runner = ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '14.04')
      runner.converge(described_recipe)
    end

    it 'should install apache2 package' do
      expect(chef_run_ubuntu).to install_package('apache2')
    end

    it 'should enable and start apache2 service' do
      expect(chef_run_ubuntu).to start_service('apache2')
      expect(chef_run_ubuntu).to enable_service('apache2')
    end
  end

  context 'When all attributes are default, on CentOS' do
    let(:chef_run_centos) do
      runner = ChefSpec::ServerRunner.new(platform: 'centos', version: '7.0')
      runner.converge(described_recipe)
    end

    it 'should install httpd package' do
      expect(chef_run_centos).to install_package('httpd')
    end

    it 'should enable and start httpd service' do
      expect(chef_run_centos).to start_service('httpd')
      expect(chef_run_centos).to enable_service('httpd')
    end
  end
end
