#!/bin/bash

WORKDIR="/root/RedTeamToolkit/osint"
GITHUB="https://github.com"

mkdir $WORKDIR

echo "Installing OSINT/Recon tools"
apt update && apt install -y libncurses5 libxml2 tcpdump libexiv2-dev libmariadb3 libmariadb-dev libmariadb-dev-compat tor
cd $WORKDIR
git clone $GITHUB/0xinfection/tidos-framework.git
git clone $GITHUB/xadhrit/terra.git
git clone $GITHUB/twintproject/twint.git
git clone $GITHUB/sundowndev/phoneinfoga.git
git clone $GITHUB/sham00n/buster.git
git clone $GITHUB/thewhiteh4t/pwnedOrNot.git
git clone $GITHUB/nmap/nmap.git
git clone $GITHUB/laramies/theHarvester.git
git clone $GITHUB/laramies/metagoofil.git
git clone $GITHUB/lanmaster53/recon-ng.git
git clone $GITHUB/xillwillx/skiptracer.git
git clone $GITHUB/FortyNorthSecurity/Just-Metadata.git
git clone $GITHUB/smicallef/spiderfoot.git
git clone $GITHUB/thewhiteh4t/FinalRecon.git
git clone $GITHUB/21y4d/nmapAutomator.git
git clone $GITHUB/Datalux/Osintgram.git
git clone $GITHUB/Greenwolf/social_mapper.git
git clone $GITHUB/m8r0wn/CrossLinked.git
git clone $GITHUB/sense-of-security/ADRecon
git clone $GITHUB/maldevel/EmailHarvester.git
git clone $GITHUB/vaguileradiaz/tinfoleak.git
echo "Done"