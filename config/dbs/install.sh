#!/bin/bash

## POSTGRESQL
# install postgres
sudo apt-get install -y postgresql postgresql-contrib

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

# stop postgres to replace config files
sudo systemctl stop postgresql

# insert custom postgresql config
sudo cp -r postgresql.conf /etc/postgresql/12/main/postgresql.conf
sudo cp -r pg_hba.conf /etc/postgresql/12/main/pg_hba.conf

# restart postgresql
sudo systemctl start postgresql

## REDIS
# install redis
sudo apt-get update && sudo apt-get install -y redis-server

# add custom redis config files
sudo mv redis.conf /etc/redis/redis.conf

# restart redis
sudo systemctl restart redis
