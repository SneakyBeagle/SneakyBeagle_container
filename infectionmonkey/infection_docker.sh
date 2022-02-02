#!/bin/bash

# Based on instructions found on https://www.guardicore.com/infectionmonkey/docs/setup/docker/

# Execute as root
if [ "$EUID" -ne 0 ]; then
    echo "Not updating since not being run as root. This skips some error checking."
else
    # If root, update, check if wget exists and install if not
    apt-get update
    RES=$(which wget)
    if [ -n "$RES" ]; then
	echo "wget is installed here: $RES"
    else
	apt-get install -y wget
    fi
fi

# Download infectionmonkey container
wget https://guardicore-infectionmonkey.s3.amazonaws.com/Files/1.12.0/InfectionMonkey-docker-v1.12.0.tgz
# Unpack the archive
tar -xvzf InfectionMonkey-docker-v1.12.0.tgz
# Pull mongo and load infectionmonkey
docker pull mongo:4.2
docker load -i InfectionMonkey-docker-v1.12.0.tar

# Start MongoDB docker container
docker run \
       --name monkey-mongo \
       --network=host \
       --volume db:/data/db \
       --detach \
       mongo:4.2

# Start Monkey Island with default self-signed certificate
docker run \
       --tty \
       --interactive \
       --name monkey-island \
       --network=host \
       guardicore/monkey-island:1.12.0
