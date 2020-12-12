#!/bin/bash

# 1. Run Gunicorn
echo "Running Gunicorn..."
eval "gunicorn ${DJANGO_WSGI_MODULE}:application --config 'gunicorn.conf.py'"
if [ $? -eq 0 ]; then
    echo "Successfuly lauched Gunicorn server!"
else
    echo "Error on lauching Gunicorn server!"
    exit 1
fi
