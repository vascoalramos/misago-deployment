# Install Misago

**NOTE:** This tutorial assumes that you have the VMs defined in `Vagrantfile` (to ru those VMs: `vagrant up`)

## VM BD
1. Copy config: `ssh vagrant@10.0.0.102 "mkdir config" && scp -r config/dbs/* vagrant@10.0.0.102:config`
2. Enter VM: `ssh vagrant@10.0.0.102`
3. Install and config PostgreSQL: `bash config/install.sh`

**NOTE:** If you restart this VM and the database isn't up, run: `sudo -u postgres pg_ctlcluster 12 main start`

## VM SERVER
1. Copy Misago: `scp -r misago vagrant@10.0.0.101:`
2. Copy config: `scp -r config/server/* vagrant@10.0.0.101:misago && scp -r config/server/.env vagrant@10.0.0.101:misago`
3. Enter VM: `ssh vagrant@10.0.0.101`
4. Install packages ans run server: `bash misago/run.sh`

## Authors
* **Daniel Regado:** [guiyrt](https://github.com/guiyrt)
* **Diogo Ferreira:** [DiogoFerreira99](https://github.com/DiogoFerreira99)
* **Fábio Gonçalves:** [FabioGoncalves](https://github.com/FabioGoncalves)
* **Filipe Freitas:** [filipejsfreitas](https://github.com/filipejsfreitas)
* **Vasco Ramos:** [vascoalramos](https://vascoalramos.me)

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
