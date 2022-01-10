#!/bin/bash

WORKDIR="/root/RedTeamToolkit/phishing"
GITHUB="https://github.com"

mkdir $WORKDIR

echo "Installing phishing tools"

apt install golang-go

cd $WORKDIR
git clone $GITHUB/trustedsec/social-engineer-toolkit.git && cd social-engineer-toolkit && pip3 install -r requirements.txt && cd $WORKDIR
git clone $GITHUB/L4bF0x/PhishingPretexts.git
git clone $GITHUB/ryhanson/phishery.git
git clone $GITHUB/htr-tech/zphisher.git 
git clone $GITHUB/rsmusllp/king-phisher.git && cd king-phisher/tools && ./install.sh && cd $WORKDIR
git clone $GITHUB/kgretzky/evilginx2.git && cd evilginx2 && make && make install && cd $WORKDIR
git clone $GITHUB/initstring/evil-ssdp.git
#git clone $GITHUB/Raikia/FiercePhish.git
git clone $GITHUB/gophish/gophish.git && cd gophish && go build && cd $WORKDIR
git clone $GITHUB/mandiant/ReelPhish.git && cd ReelPhish && pip3 install -r requirements.txt && cd $WORKDIR
git clone $GITHUB/ustayready/CredSniper.git && cd CredSniper && pip3 install -r requirements.txt
cd $WORKDIR
echo "Done"