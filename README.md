Ping
====

A small container that greets on port 80.

## Build

```
./build.sh
docker build -t catalyst-zero/ping .
```

## Usage

Used in the dockzero stack as a healthcheck for the routing layer. This container is bound to (systemd unit: BindTo) the routing layer and mapped to port 8080. Eg. the ELB can check if there is a "hello" on 8080 to send traffic to this host. 
