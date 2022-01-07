#!/bin/bash
# Execute as root
docker load -i dk.monkeyisland.latest.tar
docker pull mongo
mkdir -p /var/monkey-mongo/data/db
docker run --name monkey-mongo --network=host -v /var/monkey-mongo/data/db:/data/db -d mongo
docker run --name monkey-island --network=host -d guardicore/monkey-island:1.8.0