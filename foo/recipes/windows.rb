include_recipe 'iis'
include_recipe 'foo::content'

iis_site 'Default Web Site' do
  action [:stop, :delete]
end

iis_site 'foo site' do
  protocol :http
  port 80
  path "#{node[:iis][:docroot]}\\foo_site"
  action [:add, :start]
end
