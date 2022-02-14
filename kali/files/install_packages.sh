#!/bin/bash

# In case the build has failed to install packages, this script can install them.

packages="ssh apt-utils wget curl netcat-traditional nmap\
    gobuster python3 python3-pip iproute2 dnsutils iputils-ping emacs-nox sqlmap whois\
    nikto  net-tools git nfs-common tcpdump seclists inetutils-traceroute vim golang-go"

apt-get update && apt-get install $packages

pip install httpx[cli] && pip install nwrapy

go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest &&\
    /root/go/bin/nuclei -ut

go install -v github.com/glebarez/cero@latest
