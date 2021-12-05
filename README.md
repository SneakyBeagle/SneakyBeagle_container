# SneakyBeagle container
Simple docker compose file and Dockerfiles to build a kali container and a Nessus container. Made to simplify deployments during pentests and vulnerability scans.

# Create containers:
## Step 1:
Copy "env" to ".env" and enter the Nessus activation code, a username and a password into it, and lastly a password to ssh into the kali machine. As in the following example:
```
# Nessus
ACTIVATION_CODE=<activation_code>
USERNAME=<username>
PASSWORD=<password>
NESSUSHOSTPORT=8843

# SSH
SSHPASSWORD=<ssh_password>
SSHHOSTPORT=2222
```

Optionally, you can also configure the ports that the hosting machine will expose for the services.

## Step 2:
```
docker-compose build [service]
```
This will parse the docker-compose.yml file and start building the images accordingly. You can either build all services by running:
```
docker-compose build
```
Or build a specific service, like for example only Nessus, by running
```
docker-compose build nessus
```

## Step 3:
Depending on what service(s) you want to run, the following commands can be used:
```
docker-compose up -d
```
```
docker-compose up -d nessus
```
```
docker-compose up -d kali
```

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
