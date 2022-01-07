#!/bin/bash

echo "Installing optional tools"
apt-get install -y man-db w3m exploitdb smbclient dsniff testssl.sh commix hydra vim golang-go mydumper seclists python2 tar tor curl python3 python3-scapy sqsh metasploit-framework
cd /usr/share/wordlists && git clone https://github.com/swisskyrepo/PayloadsAllTheThings.git
cd /root/tools && git clone https://github.com/TryCatchHCF/PacketWhisper.git
cd /root/tools && git clone https://github.com/SneakyBeagle/nwrapy.git
cd /root/tools/nwrapy/ && ./install.sh
cd /root/tools && git clone https://github.com/SneakyBeagle/CreepyCrawler.git
cd /root/tools/CreepyCrawler/ && ./install.sh
cd /root/tools && git clone https://github.com/trustedsec/egressbuster.git
cd /root/tools && git clone https://github.com/omer-dogan/kali-whoami.git && cd /root/tools/kali-whoami && make install
go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
nuclei -ut
echo "Done"
