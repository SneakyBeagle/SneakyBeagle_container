# Build container:
```
docker build -t attackdocker .
```

# Run container with SSH:
```
docker run -p 2222:22 --name attackct -it attackdocker
```
This will run the containers SSH and bind it to the hosts port 2222.

# Credentials
```
root:attack
```
Make sure to change this and look over the sshd_config to make sure
it fits your needs and is secure enough for your needs.

# Installed tools

## Through apt:
- curl
- netcat-traditional
- nmap
- gobuster
- python3
- python3-pip
- seclists (placed in /usr/share)
- iproute2
- dnsutils (used for dig)
- iputils-ping (ping)
- testssl.sh
- emacs-nox (emacs without GUI)
- sqlmap
- whois
- nikto
- wget
- ssh
- exploitdb
- man-db
- net-tools
- zsh
- git
- hydra
- w3m
- commix
- vim
- golang-go

## Through git:
- croc (easily share files with any other computer through a secure relay)
- PayloadAllTheThings
