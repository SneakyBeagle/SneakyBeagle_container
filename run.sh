#!/bin/bash

echo "Building..."
docker build -t sneakybeagle .

echo "Stopping SSH daemon"
systemctl stop sshd

echo "Running docker container and opening port 22 for SSH and port 8843 for nessus"
docker run --name snbg -p 8843:8843 -p 22:22 -it attackimage
