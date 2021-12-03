#!/bin/bash

echo "Installing optional tools"
apt-get install -y man-db w3m exploitdb smbclient dsniff testssl.sh commix hydra vim golang-go mydumper seclists
cd /usr/share/wordlists && git clone https://github.com/swisskyrepo/PayloadsAllTheThings.git
echo "Done"
