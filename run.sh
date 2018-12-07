#!/bin/bash
set -e

# Copy over the files if they are missing
if [[ ! -f "/config/mosquitto.conf" ]]; then
  cp -R /defaults/* /config/
  mv /config/mosquitto.conf.example /config/mosquitto.conf
  mkdir /config/data
  mkdir /config/log
  touch /config/log/mosquitto.log
fi

# Copy over an example - especially if upgraded and existing conf is there
cp /defaults/mosquitto.conf.example /config/mosquitto.conf.example

# Create an empty password if missing
if [[ ! -f "/config/passwords.mqtt" ]]; then
    touch /config/passwords.mqtt
fi

# add unencrypted password file to the beginning of password.mqtt
if [[ -f "/config/passwords.txt" ]]; then
    mosquitto_passwd -U /config/passwords.txt
    cat /config/passwords.mqtt >> /config/passwords.txt
    rm /config/passwords.mqtt
    mv /config/passwords.txt /config/passwords.mqtt
fi

chmod -R 666 /config
chown mosquitto:mosquitto -R /var/lib/mosquitto

echo -e "Starting supervisord"
supervisord -c /etc/supervisor/conf.d/supervisord.conf
