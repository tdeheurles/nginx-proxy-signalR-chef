include_recipe "apt"

package 'nginx' do
  action :install
end

service 'nginx' do
  action [ :enable, :start ]
end

directory '/usr/share/nginx/html' do
  owner 'ubuntu'
  group 'ubuntu'
  mode '0755'
  action :create
end

cookbook_file "/usr/share/nginx/html/index.html" do
  source "index.html"
  mode "0644"
end

