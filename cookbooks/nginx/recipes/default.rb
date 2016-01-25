include_recipe "apt"

package 'nginx' do
  action :install
end

service 'nginx' do
  action [ :enable, :start ]
end

execute "chown" do
  command "chown ubuntu /var/log/nginx"
  command "chown ubuntu /var/log/nginx/error.log"
  command "chown ubuntu /var/log/nginx/access.log"
end

cookbook_file "/etc/nginx/nginx.conf" do
  source "nginx.conf"
  mode "0644"
end
