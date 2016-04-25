require 'spec_helper'

describe 'foo::content' do
  context 'When all attributes are default, on Linux' do
    let(:chef_run_linux) do
      runner = ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '14.04')
      runner.converge(described_recipe)
    end

    it 'should create web root directory' do
      expect(chef_run_linux).to create_directory('/var/www/html/foo_site/')
    end

    it 'should create index page' do
      expect(chef_run_linux).to create_template('/var/www/html/foo_site/index.html')
    end
  end
end
