#
# Cookbook Name:: foo
# Spec:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'foo::default' do
  context 'When all attributes are default, on Linux' do
    let(:chef_run_linux) do
      runner = ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '14.04')
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run_linux }.to_not raise_error
    end

    it 'should include linux recipe' do
      expect(chef_run_linux).to include_recipe('foo::linux')
    end

    it 'should not include windows recipe' do
      expect(chef_run_linux).to_not include_recipe('foo::windows')
    end
  end

  context 'When all attributes are default, on Windows' do
    let(:chef_run_windows) do
      runner = ChefSpec::ServerRunner.new(platform: 'windows', version: '2012R2')
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run_windows }.to_not raise_error
    end

    it 'should not include linux recipe' do
      expect(chef_run_windows).to_not include_recipe('foo::linux')
    end

    it 'should include windows recipe' do
      expect(chef_run_windows).to include_recipe('foo::windows')
    end
  end
end
