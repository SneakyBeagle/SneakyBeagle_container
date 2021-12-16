#!/bin/bash

WORKDIR="/root/"
GITHUB="https://github.com"

echo "Installing recon tools"
cd $WORKDIR
git clone $GITHUB/nmap/nmap.git
git clone $GITHUB/laramies/theHarvester.git
git clone $GITHUB/laramies/metagoofil.git
git clone $GITHUB/lanmaster53/recon-ng.git
git clone $GITHUB/xillwillx/skiptracer.git
git clone $GITHUB/FortyNorthSecurity/Just-Metadata.git
git clone $GITHUB/smicallef/spiderfoot.git
echo "Done"