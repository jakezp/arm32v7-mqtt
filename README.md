# Mosquitto MQTT server
Eclipse Mosquitto is an open source (EPL/EDL licensed) message broker that implements the MQTT protocol versions 3.1 and 3.1.1. Mosquitto is lightweight and is suitable for use on all devices from low power single board computers to full servers.
<p>


## Run with:
```
docker run -d --name='mqtt' --network br0 \
    --ip 192.168.1.x --cap-add NET_ADMIN \
    -e TZ="Africa/Johannesburg" \
    -v '/docker-data/mqtt':'/config':'rw' \
jakezp/arm32v7-mqtt:latest
```
## Resources:
    Dockerfile - Build docker image
    README.md - This file
    rpi-pai.service - systemd file to auto start docker
    run.sh - Start the service
    supervisord.conf - Supervisor config
<p>
    
## RPI Image
This repo is for creating a docker image for Raspberry PI
    
## Dockerhub
https://hub.docker.com/r/jakezp/arm32v7-mqtt/
