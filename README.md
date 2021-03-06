# Misago Deployment

This repository is the result of the execution of the last Systems Deployment and Benchmarking (2020/2021) practical assignment. It consists of automating the deployment and monitoring of a web-based multi-layer application called [Misago](https://misago-project.org) and, also, develop benchmarking routines to test the deployed infrastructure.

## Full Deployment

### How to Run

#### Prerequisites

-   [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)
-   [Python 3](https://www.python.org/downloads)
-   [pip3](https://pip.pypa.io/en/stable/installing/)
-   Google Cloud Auth Credentials (JSON)

#### Installation

```bash
pip3 install requests google-auth
ansible-galaxy collection install google.cloud
ansible-galaxy collection install ansible.posix
ansible-galaxy collection install community.general
```

#### Execution

-   To run a full provisioning (creates all VMs, installs docker, monitoring tools & deploys a stack):

    ```bash
    ANSIBLE_CONFIG=ansible.cfg ansible-playbook playbook.yml --tags "create-vms,provision"
    ```

-   To delete the VMs after testing that this does indeed work:

    ```bash
    ANSIBLE_CONFIG=ansible.cfg ansible-playbook playbook.yml --tags "delete-vms"
    ```

-   To scale up or down a service:

    -   Available services:

        -   web - default 3
        -   celery - default 1
        -   misago - default 3

    -   Examples:
        ```bash
        ANSIBLE_CONFIG=ansible.cfg ansible-playbook -i hosts.gcp.yml scale.yml -e "web=3"
        ANSIBLE_CONFIG=ansible.cfg ansible-playbook -i hosts.gcp.yml scale.yml -e "web=3 celery=1 misago=3"
        ```

### Orchestration

The orchestration was done based on [Docker](https://www.docker.com) and [Docker Swarm](https://docs.docker.com/get-started/swarm-deploy). This phase of deployment was the result of the improvement of the work described in the [Intermediate Installation section](#intermediate-installation).

### Provisiong

The entire infrastructure uses [GCP](https://cloud.google.com) and to automate the whole process of provision and configuration, we use [Ansible](https://www.ansible.com).

### Monitoring

Monitoring was implemented with [ELK Stack](https://www.elastic.co/what-is/elk-stack), more specifically: [ElasticSearch](https://www.elastic.co/elasticsearch), [Kibana](https://www.elastic.co/kibana) and [Beats](https://www.elastic.co/beats).

### Benchmarking

The deployment was evaluated/tested with benchmarking mechanisms, including loading tests. Those testes era implemented with [Apache Jmeter](https://jmeter.apache.org) and are available in the [benchmarking folder](benchmarking).

## Intermediate Installation

### Prerequisites

-   GCP VMs are already created and configured with docker e docker swarm
-   The docker swarm cluster is already created and all necessary nodes(VMs) are registered
-   So the system works as intended, it is needed to create NFS volumes accordingly with the volumes defined in [docker-stack.yml](deployment/docker/docker-stack.yml). To create those, follow the steps specified in [
    How To Set Up an NFS Mount on Ubuntu 20.04](https://www.digitalocean.com/community/tutorials/how-to-set-up-an-nfs-mount-on-ubuntu-20-04)
-   Consider that the VM name `vr-vm3` is the host monitoring VM, so this one should be up and running with the services **elasticsearch** and **kibana**.
    All remaining services are configured to communicate and report to this VM.

    -   To run those services:

        ```bash
        sudo sysctl -w vm.max_map_count=262144
        ./elasticsearch-7.10.1/bin/elasticsearch -d
        nohup ./kibana-7.10.1-linux-x86_64/bin/kibana &
        ```

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
