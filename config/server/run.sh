#!/bin/bash

# install packages
sudo apt-get install -y vim libffi-dev libssl-dev sqlite3 libjpeg-dev libopenjp2-7-dev locales cron postgresql-client gettext python3-pip

# install python3 requirements
pip3 install --upgrade pip && pip3 install -r requirements.txt && pip3 install -r requirements-plugins.txt

# export .env variables
set -o allexport && source .env

# run database migrations
python3 manage.py migrate

# install & enable systemd service
sudo cp misago.service /etc/systemd/system/
sudo systemctl start misago
sudo systemctl enable misago
