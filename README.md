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


## Distribution 

The container is available on the following docker hub location : 
