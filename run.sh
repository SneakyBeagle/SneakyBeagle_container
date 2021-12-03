#!/bin/bash

CTNAME="snbg"
SSHPORT=22
NESSUSPORT=8843
IMAGE="sneakybeagle"

echo -n "Enter a password to use for the container: "
read -s password

echo ""

echo "Building..."
docker build -t $IMAGE . --build-arg password=$password
echo "Done building"

echo "Stopping SSH daemon to allow the container to expose port 22"
systemctl stop sshd

echo "Running docker container and opening port 22 for SSH and port 8843 for nessus"
echo "Container name: $CTNAME"
docker run --name $CTNAME -p $NESSUSPORT:8843 -p $SSHPORT:22 -it $IMAGE
