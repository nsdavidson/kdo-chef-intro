if node[:os] == 'linux'
  web_root = '/var/www/html/foo_site/'
else
  web_root = "#{node[:iis][:docroot]}\\foo_site\\"
end

directory web_root

template "#{web_root}index.html" do
  source 'index.html.erb'
  variables({ :hostname => node[:fqdn],
              :os       => node[:platform],
              :os_ver   => node[:platform_version],
              :content  => node[:foo][:web_content]})
end
