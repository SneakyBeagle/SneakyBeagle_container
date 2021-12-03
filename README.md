# SneakyBeagle container
Simple docker compose file and Dockerfiles to build a kali container and a Nessus container. Made to simplify deployments during pentests and vulnerability scans.

# Create containers:
```
./run.sh
```
This will run docker-compose and build two images and containers. One Kali with some tooling and configuration modifications and one Nessus.
Once executed, you will be prompterd for a password to use for the root user of the container. It will only ask it once, so make sure you get it right, or be prepared to rebuild the container(s).
```
Starting...
Enter a password to use for the container:
```
Once done, you will be able to login to the kali container via SSH and to the nessus server via HTTPS.


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
