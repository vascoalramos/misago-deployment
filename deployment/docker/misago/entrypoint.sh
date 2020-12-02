#!/bin/bash

# 1. Collect static files
echo "Collecting static files..."
eval "rm -rf /srv/misago/devproject/static"
eval "python3 manage.py collectstatic"
echo "Collected static files!"

# 2. Populate the Database
echo "Migrating database..."
eval "python3 manage.py migrate"
if [ $? -eq 0 ]; then
    echo "Successfuly migrated data!"
else
    echo "Error while migrating data!"
    exit 1
fi

# 3. Run Gunicorn
echo "Running Gunicorn..."
eval "gunicorn ${DJANGO_WSGI_MODULE}:application --config 'gunicorn.conf.py'"
if [ $? -eq 0 ]; then
    echo "Successfuly lauched Gunicorn server!"
else
    echo "Error on lauching Gunicorn server!"
    exit 1
fi
