default.nginx.accessLog    = "/var/log/nginx/access.log"
default.nginx.errorLog     = "/var/log/nginx/error.log"

default.nginx.certPath     = "/etc/ssl/nginxtest"
default.nginx.pemPath      = "#{default.nginx.certPath}/server.pem"
default.nginx.keyPath      = "#{default.nginx.certPath}/server.key"

default.nginx.domainName   = "nginxtest"
default.nginx.listenOn     = "80"
default.nginx.proxyPath    = "172.31.22.130"

default.nginx.nginxUser    = "ubuntu"

default.nginx.templatePath = "/tmp/nginx.conf"
