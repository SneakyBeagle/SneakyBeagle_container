#!/bin/bash

WORKDIR="/root/"
GITHUB="https://github.com"

echo "Installing anonymity tools"
apt-add-repository ppa:i2p-maintainers/i2p
apt-get update
apt-get install i2p
#apt-get install shadowsocks-libev
cd $WORKDIR
git clone $GITHUB/
