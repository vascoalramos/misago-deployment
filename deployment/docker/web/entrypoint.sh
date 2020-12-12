#!/bin/sh

# Define default value for app container hostname and port
#APP_HOST=${APP_HOST:-app}
# APP_PORT_NUMBER=${APP_PORT_NUMBER:-8000}

# linking Nginx configuration file
ln -s /etc/nginx/sites-available/misago$ssl /etc/nginx/conf.d/misago.conf

# Setup app host and port on configuration file
sed -i "s/{%APP_HOST%}/${APP_HOST}/g" /etc/nginx/conf.d/misago.conf
sed -i "s/{%APP_PORT%}/${APP_PORT_NUMBER}/g" /etc/nginx/conf.d/misago.conf

# add stuff to file beat
#eval "echo http://dl-cdn.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories"
#eval "apk update"
#eval "apk add filebeat"
# filebeat enable nginx module
# eval "filebeat modules enable nginx"
# run filebeat
# eval "filebeat -e &"

# save ip in an environment variable
export HOST_IP=$HOST_MONITORING_TAG$(awk 'END{print $1}' /etc/hosts)

# Run metric collector - telegraf
# eval "/usr/bin/telegraf --config /telegraf.conf &"

# Run ip blocker interface
# eval "python3 block_ip_app.py &"

rm -f /var/log/nginx/*

# run Nginx
exec nginx -g 'daemon off;'
