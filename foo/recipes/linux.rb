platform = node['platform_family']

if platform == 'rhel'
  apache_pkg = 'httpd'
  apache_srv = 'httpd'
elsif platform == 'debian'
  apache_pkg = 'apache2'
  apache_srv = 'apache2'
else
  Chef::Log.info('This platform is not supported by the foo cookbook!')
end

package apache_pkg

service apache_srv do
  action [:enable, :start]
end

include_recipe 'foo::content'
