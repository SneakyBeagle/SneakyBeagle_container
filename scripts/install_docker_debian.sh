#!/bin/bash

apt-get remove docker docker-engine docker.io containerd runc

apt-get update
apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

apt-get update
apt-get install docker-ce docker-ce-cli containerd.io

wget https://github.com/docker/compose/releases/download/v2.3.3/docker-compose-linux-x86_64
chmod +x docker-compose-linux-x86_64
mv docker-compose-linux-x86_64 /usr/bin/docker-compose
