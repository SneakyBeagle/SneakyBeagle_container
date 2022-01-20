#!/bin/bash

WORKDIR="/root/RedTeamToolkit/osint"
GITHUB="https://github.com"

mkdir $WORKDIR

echo "Installing OSINT/Recon tools"
apt update && apt install -y libncurses5 libxml2 tcpdump libexiv2-dev libmariadb3 libmariadb-dev libmariadb-dev-compat tor cmake libboost-all-dev
cd $WORKDIR
git clone $GITHUB/cbk914/SecLists.git
git clone $GITHUB/0xinfection/tidos-framework.git && cd tidos-framework && pip3 install -r requirements.txt && cd $WORKDIR
git clone $GITHUB/xadhrit/terra.git && cd terra && pip3 install -r requirements.txt && cd $WORKDIR
git clone $GITHUB/twintproject/twint.git && cd twint && pip3 install -r requirements.txt && cd $WORKDIR
git clone $GITHUB/sundowndev/phoneinfoga.git
git clone $GITHUB/sham00n/buster.git && cd buster && python3 setup.py install && cd $WORKDIR
git clone $GITHUB/thewhiteh4t/pwnedOrNot.git && cd pwnedOrNot && ./install.sh && cd $WORKDIR
git clone $GITHUB/laramies/theHarvester.git && cd theHarvester && pip3 install -r requirements.txt && cd $WORKDIR
git clone $GITHUB/laramies/metagoofil.git
git clone $GITHUB/lanmaster53/recon-ng.git && cd recon-ng && pip3 install REQUIREMENTS && cd $WORKDIR
git clone $GITHUB/xillwillx/skiptracer.git && cd skiptracer && pip3 install -r requirements.txt && cd $WORKDIR
git clone $GITHUB/FortyNorthSecurity/Just-Metadata.git
git clone $GITHUB/smicallef/spiderfoot.git && cd spiderfoot && pip3 install -r requirements.txt && cd $WORKDIR
git clone $GITHUB/thewhiteh4t/FinalRecon.git && cd FinalRecon && pip3 install -r requirements.txt && cd $WORKDIR
git clone $GITHUB/21y4d/nmapAutomator.git
git clone $GITHUB/Datalux/Osintgram.git && cd Osintgram && pip3 install -r requirements.txt && cd $WORKDIR
git clone $GITHUB/Greenwolf/social_mapper.git && cd social_mapper && pip3 install -r requirements.txt && cd $WORKDIR
git clone $GITHUB/m8r0wn/CrossLinked.git && cd CrossLinked && pip3 install -r requirements.txt && cd $WORKDIR
git clone $GITHUB/sense-of-security/ADRecon
git clone $GITHUB/maldevel/EmailHarvester.git && cd EmailHarvester && pip3 install -r requirements.txt && cd $WORKDIR
#git clone $GITHUB/vaguileradiaz/tinfoleak.git
cd $WORKDIR
echo "Done"