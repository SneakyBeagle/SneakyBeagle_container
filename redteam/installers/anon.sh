#!/bin/bash

WORKDIR="/root/RedTeamToolkit/anon"
GITHUB="https://github.com"

mkdir $WORKDIR

echo "Installing anonymity tools"
apt-get update
apt-get install -y openvpn torsocks proxychains wireguard
cd $WORKDIR
git clone $GITHUB/SusmithKrishnan/torghost.git && cd torghost && pip3 install -r requirements.txt
cd $WORKDIR
echo "Done"