# SneakyBeagle container
Simple container image build to run a kali that allows SSH and Nessus to be connected to. Exposes these ports externally on the host machine. The build currently results in a 5.6GB image, so not exactly lightweight. Still mean to clean this up a bit.

# Run container:
```
./run.sh
```
This will prompt you for a password to use for the root user of the container. It will only ask it once, so make sure you get it right, or be prepared to rebuild the container.

# Installed tools

- curl
- netcat-traditional
- nmap
- gobuster
- python3
- python3-pip
- seclists
- iproute2
- dnsutils
- iputils-ping
- testssl.sh
- emacs-nox
- sqlmap
- whois
- nikto
- wget
- ssh
- net-tools
- zsh
- git
- hydra
- commix
- vim
- golang-go
- mydumper
- nfs-common
- tcpdump
- croc
- ohmyzsh
- PayloadAllTheThings
- Nessus


## Optional
- man-db
- w3m
- exploitdb
- smbclient
- dsniff
