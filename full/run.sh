#!/bin/bash

echo "Building..."
docker build -t attackimage .

echo "Stopping SSH daemon"
systemctl stop sshd

echo "Running docker container and opening port 22 for SSH"
docker run -p 22:22 --name attackdocker -it attackimage
