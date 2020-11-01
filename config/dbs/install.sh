#!/bin/bash

sudo apt update && sudo apt install -y postgresql postgresql-contrib

sudo -u postgres createuser misago

sudo -u postgres createdb misago

sudo -u postgres psql -c "ALTER USER misago WITH ENCRYPTED PASSWORD 'secret'"

sudo -u postgres psql -c "ALTER USER misago WITH SUPERUSER"

sudo -u postgres psql -c "GRANT ALL PRIVILEGES ON DATABASE misago to misago"

sudo cat config/postgresql.conf > /etc/postgresql/12/main/postgresql.conf
sudo cat config/pg_hba.conf > /etc/postgresql/12/main/pg_hba.conf

sudo systemctl restart postgresql
