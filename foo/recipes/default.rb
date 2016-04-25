os = node['os']
if os == 'linux'
  include_recipe 'foo::linux'
elsif os == 'windows'
  include_recipe 'foo::windows'
else
  Chef::Log.info('This platform is not supported!')
end
