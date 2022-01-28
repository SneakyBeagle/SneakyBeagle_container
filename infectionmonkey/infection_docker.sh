#!/bin/bash
# Execute as root
# Only compatible with docker for Linux
apt-get update && apt-get -y upgrade
FILE="/usr/bin/wget"
if [ -f "$FILE" ]; then
    echo "Let's continue..."
    else
    apt-get install wget
fi
wget https://guardicore-infectionmonkey.s3.amazonaws.com/Files/1.12.0/InfectionMonkey-docker-v1.12.0.tgz
tar -xvzf InfectionMonkey-docker-v1.12.0.tgz
docker pull mongo:4.2
docker load -i InfectionMonkey-docker-v1.12.0.tar
# Start MongoDB docker container
sudo docker run \
    --name monkey-mongo \
    --network=host \
    --volume db:/data/db \
    --detach \
    mongo:4.2
# Start Monkey Island with default self-signed certificate
sudo docker run \
    --tty \
    --interactive \
    --name monkey-island \
    --network=host \
    guardicore/monkey-island:1.12.0