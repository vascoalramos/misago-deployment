FROM nginx:alpine

# RUN apk update
# RUN apk --no-cache add

# remove default configuration and add our custom Nginx configuration files
RUN rm /etc/nginx/conf.d/default.conf && apk add --no-cache curl

# add nginx config files
ADD ./misago /etc/nginx/sites-available/
ADD ./security.conf /etc/nginx/conf.d/

# add and setup entrypoint
ADD entrypoint.sh /


# healthcheck to make sure container is ready
HEALTHCHECK CMD curl --fail http://localhost:80 || exit 1

ENTRYPOINT ["/bin/sh", "entrypoint.sh"]