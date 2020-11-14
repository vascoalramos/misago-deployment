# Misago Deployment

## Basic Installation

<details>
  <summary>Docker</summary>
  
  The Docker deployment contains four components in four containers:
   - The Frontend Web Server
   - The Postgres Database
   - The Redis Cache
   - The Celery Job Queue
  To run all of this, use docker-compose on the main directory:
  ```
  docker-compose up -d
  ```
</details>

<details>
  <summary>Linux</summary>
  
  Run this to:
   - create two distinct VMs
   - create DB
   - run all services 
  ```bash
  vagrant up
  ```
</details>

## Authors
* **Daniel Regado:** [guiyrt](https://github.com/guiyrt)
* **Diogo Ferreira:** [DiogoFerreira99](https://github.com/DiogoFerreira99)
* **Fábio Gonçalves:** [FabioGoncalves](https://github.com/FabioGoncalves)
* **Filipe Freitas:** [filipejsfreitas](https://github.com/filipejsfreitas)
* **Vasco Ramos:** [vascoalramos](https://vascoalramos.me)

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
