# Mosquitto mqtt server

Run with:
```
docker run -d --name='mqtt' --net='br0' --ip='192.168.1.53' \
  -e TZ="Africa/Johannesburg" \
  -v '/docker-data/mqtt':'/config':'rw' \
   jakezp/arm32v7-mqtt
```
