# Misago Deployment

## Intermediate Installation

### Prerequisites

-   GCP VMs are already created and configured with docker e docker swarm
-   The docker swarm cluster is already created and all necessary nodes(VMs) are registered

### How to run

```bash
scp deployment/docker/docker-stack.yml <DOCKER_SWARM_MASTER_NODE_EXTERNAL_IP>:
scp deployment/docker/.env <DOCKER_SWARM_MASTER_NODE_EXTERNAL_IP>:
```

On Docker Swarm Master Node shell, to launch the deployment stack:

```bash
set -o allexport; source .env; set +o allexport
docker stack deploy -c docker-stack.yml misago
```

## Basic Installation

<details>
  <summary>Docker</summary>
  
  The Docker deployment contains four components in four containers:
   - The Frontend Web Server
   - The Postgres Database
   - The Redis Cache
   - The Celery Job Queue
  To run all of this, use docker-compose on the main directory:
  ```bash
  cd deployment/docker && docker-compose up -d && cd ../..
  ```
</details>

<details>
  <summary>Linux</summary>
  
  Run this to:
   - create two distinct VMs
   - create DB
   - run all services 
  ```bash
  cd deployment/linux && vagrant up && cd ../..
  ```
</details>

## Authors

-   **Daniel Regado:** [guiyrt](https://github.com/guiyrt)
-   **Diogo Ferreira:** [DiogoFerreira99](https://github.com/DiogoFerreira99)
-   **Fábio Gonçalves:** [FabioGoncalves](https://github.com/FabioGoncalves)
-   **Filipe Freitas:** [filipejsfreitas](https://github.com/filipejsfreitas)
-   **Vasco Ramos:** [vascoalramos](https://vascoalramos.me)

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
