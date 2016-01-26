execute "apt-get update" do
  command "apt-get update"
end

package 'nginx' do
  action :install
end

execute "chown" do
  command "chown ubuntu /var/log/nginx"
  command "chown ubuntu /var/log/nginx/error.log"
  command "echo "" > /var/log/nginx/error.log"
  command "chown ubuntu /var/log/nginx/access.log"
  command "echo "" > /var/log/nginx/access.log"
end

cookbook_file "/etc/nginx/nginx.conf" do
  source "nginx.conf"
  owner  "ubuntu"
  mode   "0644"
end
cookbook_file "/etc/ssl/nginx/server.key" do
  source "server.key"
  owner  "ubuntu"
  mode   "0400"
end
cookbook_file "/etc/ssl/nginx/server.pem" do
  source "server.pem"
  owner  "ubuntu"
  mode   "0400"
end

service 'nginx' do
  action [ :enable, :stop, :start ]
end
