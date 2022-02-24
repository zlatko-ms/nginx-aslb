# nginx-aslb

Simple Ngnix container for tesging active/stdby load balancing.

## Rationale

The Azure Load Balancer unfortunately does not provide features such as weighed load balancing nor active/stdby setups with TCP healthchecks.

You can use this container and run it on an App Service for Containers in order to replace the Azure LB for this use case.

## Features

## Active/Standby http load balancing 

* using embedded TCP checks
* will redirect to the primary backend unless it is unavailable, switching to fallback backend when this occurs
* restoration to primary if primary is available again

## Healcheck URL 

In order to check the health of your loadbalancer by the underlying container structure you can use the **/_lbcheck url**. If the container is running it will reply with a 200 HTTP code with the following payload : 

```json
{ "status":"healthy" }
```
## Configuration 

The configuration, as for all docker containers is performed via the environnement variables.

The following mandatory variables must be provided : 


| Env Var Name                        | Purpose                                                      |
|-------------------------------------|--------------------------------------------------------------|
| LB_PORT                             | Load balancing service port, usually 80 or 8080              |
| LB_BACKEND_PRIMARY                  | host:port of the primary serving workload                    |
| LB_BACKEND_FALLBACK                 | host:port of the fallback serving workload                   |


## Usage 

### Running locally 

In order to run the container locally, serving an entry point with port *8080* and redirecting to backends located under  *192.168.4.1:8081* and *192.168.4.1:8082* you can use the following procedure : 

```bash
echo "LB_PORT=8080" >> vars.txt
echo "LB_BACKEND_PRIMARY=192.168.4.1:8081" >> vars.txt
echo "LB_BACKEND_FALLBACK=192.168.4.1:8082" >> vars.txt
docker pull zlatkoa/nginx-alsb:1.0.0
docker run -p 8080:8080 --env-file vars.txt -d --name lbexample zlatkoa/nginx-alsb:1.0.0
```

**Note** : you can use a set of [Helloer](https://github.com/zlatko-ms/helloer) to simulate your backends. 

### Running on Cloud Infra

Please make sure the you provide the *LB_PORT*, *LB_BACKEND_PRIMARY* and *LB_BACKEND_FALLBACK* envronnement variables to your pod/container deployement descriptor.

## Distribution 

For containerized deployements you can use the image available on the [Docker Hub](https://hub.docker.com/repository/docker/zlatkoa/nginx-alsb). It is updated by the Github CI/CD worklow on each code change.


You can get the container image by issuing the following commands : 

```bash
docker pull zlatkoa/nginx-alsb:1.0.0
```


