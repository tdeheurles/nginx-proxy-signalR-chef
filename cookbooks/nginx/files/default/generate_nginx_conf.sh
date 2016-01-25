#!/bin/bash

if [[ $# != 8 ]];then
  echo "Parameter number error"
  exit 1
fi

accessLog=$1
errorLog=$2
pemPath=$3
crtPath=$4
listenOn=$5
proxyPath=$6
nginxUser=$7
nginxTemplate=$8

sed -i "g|__USER__|$nginxUser|s"       nginxTemplate
sed -i "g|__ACCESS_LOG__|$accessLog|s" nginxTemplate 
sed -i "g|__ERROR_LOG__|$errorLog|s"   nginxTemplate
sed -i "g|__PEM_PATTH__|$pemPath|s"    nginxTemplate
sed -i "g|__KEY_PATH__|$serverKey|s"   nginxTemplate
sed -i "g|__PROXY_PATH__|$proxyPath|s" nginxTemplate
sed -i "g|__LISTEN_ON__|$listenOn|s" nginxTemplate

cp $nginxTemplate /etc/nginx/nginx.conf
