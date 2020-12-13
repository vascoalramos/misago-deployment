#!/bin/bash

# linking Nginx configuration file
ln -s /etc/nginx/sites-available/misago$ssl /etc/nginx/conf.d/misago.conf

# Setup app host and port on configuration file
sed -i "s/{%APP_HOST%}/${APP_HOST}/g" /etc/nginx/conf.d/misago.conf
sed -i "s/{%APP_PORT%}/${APP_PORT_NUMBER}/g" /etc/nginx/conf.d/misago.conf

# run metricbeat
eval "cd /metricbeat && ./metricbeat setup -e && ./metricbeat -e &"

# run filebeat
eval "cd ../filebeat && ./filebeat setup -e && ./filebeat -e &"

rm -f /var/log/nginx/*

# run Nginx
exec nginx -g 'daemon off;'
