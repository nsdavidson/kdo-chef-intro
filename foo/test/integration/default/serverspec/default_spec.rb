require 'spec_helper'

describe 'foo::default' do
  # Serverspec examples can be found at
  # http://serverspec.org/resource_types.html
  if os[:family] == 'redhat'
    apache_pkg = 'httpd'
    apache_srv = 'httpd'
  elsif os[:family] == 'ubuntu'
    apache_pkg = 'apache2'
    apache_srv = 'apache2'
  end

  if ['redhat', 'ubuntu'].include?(os[:family])
    web_root = '/var/www/html/foo_site'
  elsif os[:family] == 'windows'
    web_root = 'c:\\inetpub\\wwwroot\\foo_site'
  end

  describe file(web_root) do
    it { should exist }
    it { should be_directory }
  end

  describe file("#{web_root}/index.html") do
    it { should exist }
    it { should be_file }
    its(:content) { should match /Coming at you live from the amazing foo cookbook!/ }
  end

  if ['redhat', 'ubuntu'].include?(os[:family])
    describe package(apache_pkg) do
      it { should be_installed }
    end

    describe service(apache_srv) do
      it { should be_enabled }
      it { should be_running }
    end
  elsif os[:family] == 'windows'
    describe windows_feature('IIS-WebServerRole') do
      it { should be_installed }
    end

    describe service('W3SVC') do
      it { should be_enabled }
      it { should be_running }
    end

    describe iis_website('Default Web Site') do
      it { should_not be_enabled }
      it { should_not be_running }
    end

    describe iis_website('foo site') do
      it { should be_enabled }
      it { should be_running }
    end
  end
end
