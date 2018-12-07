FROM arm32v7/ubuntu:latest

LABEL maintainer="Jakezp <jakezp@gmail.com>"

ENV DEBIAN_FRONTEND noninteractive

# Update and install packages
RUN apt-get update && apt-get upgrade -yq \
    && apt-get install supervisor mosquitto libmosquitto1 iproute2 net-tools iputils-ping -yq \
    && rm -rf /var/lib/apt/ lists/* \
    && cp -R /etc/mosquitto /defaults \
    && mkdir /config

# Add config files
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
ADD run.sh /run.sh
ADD mosquitto.conf.example /defaults/mosquitto.conf.example

# Set permissions
RUN chmod +x /run.sh

WORKDIR /config
CMD ["/run.sh"]
