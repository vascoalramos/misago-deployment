# Deploy Misago

**NOTE:** This tutorial assumes that you have the VMs defined in `Vagrantfile` (to ru those VMs: `vagrant up`)

## VM BD
1. Copy config: `ssh vagrant@10.0.0.102 "mkdir config" && scp -r config/dbs/* vagrant@10.0.0.102:config`
2. Enter VM: `ssh vagrant@10.0.0.102`
3. Install PostgreSQL: `sudo apt update && sudo apt install -y postgresql postgresql-contrib`
4. Create database and user:
    ```bash
    sudo -u postgres createuser misago
    sudo -u postgres createdb misago
    sudo -u postgres psql -c "ALTER USER misago WITH ENCRYPTED PASSWORD 'secret'"
    sudo -u postgres psql -c "GRANT ALL PRIVILEGES ON DATABASE misago to misago"
    ```
5. Add custom config files:
    ```bash
    sudo mv config/postgresql.conf /etc/postgresql/12/main/postgresql.conf
    sudo mv config/pg_hba.conf /etc/postgresql/12/main/pg_hba.conf
    ```
6. Reload PostgreSQL: `sudo systemctl restart postgresql`
7. Enable PostgreSQL: `sudo systemctl enable postgresql`

## VM SERVER
1. Copy Misago: `scp -r misago vagrant@10.0.0.101:`
2. Copy config: `scp -r config/server/.env vagrant@10.0.0.101:misago`
3. Enter VM: `ssh vagrant@10.0.0.101 && cd misago`
4. Enable .env: `set -o allexport && source .env && set +o allexport`
5. Install packages: `sudo apt update && sudo apt install -y vim libffi-dev libssl-dev sqlite3 libjpeg-dev libopenjp2-7-dev locales cron postgresql-client gettext python3-pip`
6. Install requirements: `pip3 install --upgrade pip && pip3 install -r requirements.txt && pip3 install -r requirements-plugins.txt`
7. Run server: `python3 manage.py migrate && python3 manage.py runserver 0.0.0.0:8000`