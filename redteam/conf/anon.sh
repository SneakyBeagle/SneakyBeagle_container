#!/bin/bash

WORKDIR="/root/RedTeamToolkit/anon"
GITHUB="https://github.com"

mkdir $WORKDIR

echo "Installing anonymity tools"
#sapt-add-repository ppa:i2p-maintainers/i2p
apt-get update
apt-get install -y openvpn torsocks proxychains wireguard
#echo "deb [signed-by=/usr/share/keyrings/i2p-archive-keyring.gpg] https://deb.i2p2.de/ $(lsb_release -sc) main" \
#  | sudo tee /etc/apt/sources.list.d/i2p.list
#curl -o i2p-archive-keyring.gpg https://geti2p.net/_static/i2p-archive-keyring.gpg
#cp ~/i2p-archive-keyring.gpg /usr/share/keyrings
#apt install -y i2p i2p-keyring
#apt-get install shadowsocks-libev 
cd $WORKDIR
git clone $GITHUB/SusmithKrishnan/torghost.git/SusmithKrishnan/torghost
echo "Done"