#!/bin/bash
sudo apt update
sudo apt install -y vim libffi-dev libssl-dev sqlite3 libjpeg-dev libopenjp2-7-dev locales cron postgresql-client gettext python3-pip

cd misago

set -o allexport && source .env && set +o allexport

pip3 install --upgrade pip && pip3 install -r requirements.txt && pip3 install -r requirements-plugins.txt

python3 manage.py migrate && python3 manage.py runserver 0.0.0.0:8000
