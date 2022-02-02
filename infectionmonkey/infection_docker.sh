#!/bin/bash

MONKVERS=1.12.0
MONKNAME=monkey-island

MONGO=mongo:4.2
MONGONAME=monkey-mongo

INFMONKTGZ=InfectionMonkey-docker-v$MONKVERS.tgz
INFMONKTAR=InfectionMonkey-docker-v$MONKVERS.tar

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
if [ ! -f ./$INFMONKTGZ ]; then
    echo "Downloading"
    wget https://guardicore-infectionmonkey.s3.amazonaws.com/Files/$MONKVERS/$INFMONKTGZ
    # Unpack the archive
    echo "Unpacking"
fi
if [ ! -f ./$INFMONKTAR ]; then
    tar -xvzf $INFMONKTGZ
fi

# Delete Mongo
(docker stop $MONGONAME; docker rm $MONGONAME) || echo "Mongo does not exist yet"

# Delete Monkey island if it exists
(docker stop $MONKNAME; docker rm $MONKNAME) || echo "Monkey does not exist yet"

# Pull mongo and load infectionmonkey
echo "Pulling mongo"
docker pull $MONGO
echo "Loading infectionmonkey"
docker load -i $INFMONKTAR

# Start MongoDB docker container
echo "Starting mongodb"
docker run \
       --name monkey-mongo \
       --network=host \
       --volume db:/data/db \
       --detach \
       $MONGO

# Start Monkey Island with default self-signed certificate (detached)
echo "Starting Monkey Island"
docker run \
       --detach \
       --name $MONKNAME \
       --network=host \
       guardicore/monkey-island:v$MONKVERS
