include_recipe "apt"

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
cookbook_file "/tmp/generate_certs.sh" do
  source "generate_certs.sh"
  owner  "ubuntu"
  mode   "0755"
end

execute "certs" do
  command "cd /tmp && ./generate_certs.sh nginxtest"
end

service 'nginx' do
  action [ :enable, :stop, :start ]
end
