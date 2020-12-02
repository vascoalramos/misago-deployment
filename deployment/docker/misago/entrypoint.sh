#!/bin/bash

# 1. Collect static files
echo "Collecting static files..."
eval "rm -rf /srv/misago/devproject/static"
eval "python3 manage.py collectstatic"
echo "Collected static files!"

python3 manage.py migrate
# python3 manage.py runserver 0.0.0.0:8000

eval "gunicorn ${DJANGO_WSGI_MODULE}:application --config 'gunicorn.conf.py'"
# eval "gunicorn -b 0.0.0.0:8000 --workers 5 devproject.wsgi:application --access-logformat  'Host:%(h)s %(l)s Username:%(u)s DateOfRequest:%(t)s Method:%(m)s Status:%(s)s URL:%(U)s ReponseLength:%(B)s Agent:%(a)s  ResponseHeader:%({server-timing}o)s' --access-logfile '-' --error-logfile '-'"
if [ $? -eq 0 ]; then
    echo "Successfuly lauched Gunicorn server!"
else
    echo "Error on lauching Gunicorn server!"
    exit 1
fi
