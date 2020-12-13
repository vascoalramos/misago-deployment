FROM nginx

# remove default configuration and add our custom Nginx configuration files
RUN rm /etc/nginx/conf.d/default.conf && apt-get update && apt-get install -y curl

# add nginx config files
ADD ./misago /etc/nginx/sites-available/
ADD ./security.conf /etc/nginx/conf.d/

# add and setup entrypoint
ADD entrypoint.sh /

# add metricbeat
ADD metricbeat /metricbeat

# add filebeat
ADD filebeat /filebeat

# healthcheck to make sure container is ready
HEALTHCHECK CMD curl --fail http://localhost:80 || exit 1

ENTRYPOINT ["/bin/bash", "entrypoint.sh"]