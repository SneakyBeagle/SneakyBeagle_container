#!/bin/bash

WORKDIR="/root/RedTeamToolkit/phishing"
GITHUB="https://github.com"

mkdir $WORKDIR

echo "Installing phishing tools"
cd $WORKDIR
git clone $GITHUB/trustedsec/social-engineer-toolkit.git
git clone $GITHUB/L4bF0x/PhishingPretexts.git
git clone $GITHUB/ryhanson/phishery.git
git clone $GITHUB/htr-tech/zphisher.git
git clone $GITHUB/rsmusllp/king-phisher.git
git clone $GITHUB/kgretzky/evilginx2.git
git clone $GITHUB/initstring/evil-ssdp.git
git clone $GITHUB/Raikia/FiercePhish.git
git clone $GITHUB/gophish/gophish.git
git clone $GITHUB/mandiant/ReelPhish.git
git clone $GITHUB/ustayready/CredSniper.git
echo "Done"