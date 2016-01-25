# install
include_recipe "apt"

package 'nginx' do
  action :install
end

service 'nginx' do
  action [ :enable, :start ]
end

execute "chown" do
  command "chown #{node.nginx.nginxUser} #{node.nginx.accessLog}"
  command "chown #{node.nginx.nginxUser} #{node.nginx.errorLog}"
end

# get files
cookbook_file "/tmp/generate_certificates.sh" do
  source "generate_certificates.sh"
  mode "0755"
end
cookbook_file "/tmp/generate_nginx_conf.sh" do
  source "generate_nginx_conf.sh"
  mode "0755"
end
cookbook_file "/tmp/nginx.conf" do
  source "nginx.conf"
  mode "0644"
end

# execute configuration
execute "configure_nginx" do
  command <<-EOF
    cd /tmp
    
    ls -la
    
    ./generate_certificates.sh  \
       #{node.nginx.domainName} \
       #{node.nginx.certPath}
    
    ./generate_nginx_conf.sh      \
       #{node.nginx.accessLog}    \
       #{node.nginx.errorLog}     \
       #{node.nginx.pemPath}      \
       #{node.nginx.keyPath}      \
       #{node.nginx.listenOn}     \
       #{node.nginx.proxyPath}    \
       #{node.nginx.nginxUser}    \
       #{node.nginx.templatePath}
    EOF
end
