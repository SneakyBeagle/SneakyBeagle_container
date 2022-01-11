#!/bin/bash

tools="python3.9-venv man-db w3m exploitdb smbclient dsniff testssl.sh commix hydra vim golang-go mydumper seclists python2 tar tor curl python3 python3-scapy sqsh metasploit-framework netdiscover iptraf-ng kali-archive-keyring terminator python3-poetry"
workdir=/root/tools
wlistdir=/usr/share/wordlists

echo "Installing optional tools $tools"
apt-get install -y $tools

echo "Pulling some wordlists"
git clone https://github.com/swisskyrepo/PayloadsAllTheThings.git $wlistdir/payloadallthethings

echo "Moving to $workdir and installing some more tools from github"
cd $workdir
echo "Installing PacketWhisper"
git clone https://github.com/TryCatchHCF/PacketWhisper.git

echo "Installing CreepyCrawler"
git clone https://github.com/SneakyBeagle/CreepyCrawler.git

echo "Installing egressbuster"
git clone https://github.com/trustedsec/egressbuster.git

echo "Installing Bloodhound.py"
git clone https://github.com/fox-it/BloodHound.py.git
cd $workdir/BloodHound.py && pip install .
cd $workdir

echo "Installing some tools through pip"
echo "Installing nwrapy"
python3 -m pip install nwrapy

echo "Installing croc"
curl https://getcroc.schollz.com | bash
#echo "Installing Kali Intelligence suite"
#git clone https://github.com/chopicalqui/KaliIntelligenceSuite.git && \
#    cd KaliIntelligenceSuite && pip install -r requirements.txt && \
#    pip install cachecontrol && export POETRY_VIRTUALENVS_IN_PROJECT=true && \
#    export POETRY_VIRTUALENVS_PATH=$workdir/KaliIntelligenceSuite/.venv/ && \
#    poetry install --no-root --no-dev

echo "Installing nuclei"
go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
echo "Updating nuclei templates"
nuclei -ut

echo "Installing Active Directory tools"
wget https://github.com/ropnop/kerbrute/releases/download/v1.0.3/kerbrute_linux_amd64 -O /usr/bin/kerbrute && chmod +x /usr/bin/kerbrute
