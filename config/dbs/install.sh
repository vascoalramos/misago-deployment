#!/bin/bash

# install postgres
sudo apt update && sudo apt install -y postgresql postgresql-contrib

# create user 'misago'
sudo -u postgres createuser misago

# create database 'misago'
sudo -u postgres createdb misago

# update user password
sudo -u postgres psql -c "ALTER USER misago WITH ENCRYPTED PASSWORD 'secret'"

# update user role to superuser
sudo -u postgres psql -c "ALTER USER misago WITH SUPERUSER"

# allow user 'misago' to access database 'misago'
sudo -u postgres psql -c "GRANT ALL PRIVILEGES ON DATABASE misago to misago"

# insert custom postgresql config
sudo bash -c 'cat config/postgresql.conf > /etc/postgresql/12/main/postgresql.conf'
sudo bash -c 'cat config/pg_hba.conf > /etc/postgresql/12/main/pg_hba.conf'

# restart postgresql
sudo systemctl restart postgresql
