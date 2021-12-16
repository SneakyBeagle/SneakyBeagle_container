# SneakyBeagle container

Simple docker compose file and Dockerfiles to build a kali container, a Nessus container, a container with a complete toolkit for Red Team operations, and a container with Infection Monkey for continuous pentesting, and attack simulations. Made to simplify deployments during pentests and vulnerability scans. Exposes ports 2222,5000 and 8834 on the hosting machine. Port 2222 is used to SSH into the kali container and port 8834 is used to expose Nessus. Infection Monkey exposes port 5000. Settings can be changed in the environment file, see [Step 1](#step-1).

# Create containers:

## Step 1:

Copy "env" to ".env".

```
cp env .env
```

Enter (in .env) the Nessus activation code, a username and a password, and lastly a password to ssh into the kali machine. As in the following example:

```
# Nessus
ACTIVATION_CODE=AAAA-BBBB-CCCC-DDDD
USERNAME=admin
PASSWORD=awesomepassword
NESSUSHOSTPORT=8834

# SSH
SSHPASSWORD=anotherawesomepassword
SSHHOSTPORT=2222
```

Optionally, you can also configure the ports that the hosting machine will expose for the services.

### [Optional] Step 1.2:

A number of optional tools can be installed in the Kali container. This is disabled by default to speed up the build, but can be enabled by uncommenting the following lines in the [Kali Dockerfile](kali/Dockerfile):

```
## UNCOMMENT TO INSTALL OPTIONAL
#COPY conf/install_optional.sh /root/install_optional.sh
#RUN chmod +x /root/install_optional.sh && /root/install_optional.sh && rm /root/install_optional.sh
```

The default tools can be found [here](#kali) and the optional tools can be found [here](#optional)

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

# Stop containers

To stop the containers, run:

```
docker-compose stop
```

# Remove containers

To remove the containers, once stopped, run:

```
docker-compose rm
```

# Installed tools

## Kali

- curl
- netcat-traditional
- nmap
- gobuster
- python3
- python3-pip
- iproute2
- dnsutils
- iputils-ping
- emacs-nox
- sqlmap
- whois
- nikto
- wget
- ssh
- net-tools
- git
- nfs-common
- tcpdump
- seclists

## Optional

- man-db
- w3m
- exploitdb
- smbclient
- dsniff
- testssl.sh
- commix
- hydra
- vim
- golang-go
- mydumper
- PayloadsAllTheThings

# Red Team

Split into categories, each script installs a defined toolkit for all red team phases and attack vectors.

* Anon

  * Tor
  * TORsocks
  * ProxyChains
* Data Analysis
* Exfiltration

  * Mistica
* Exploitation

  * impacket
  * BEEF
  * bettercap
  * Empire 4
  * Metasploit
  * jok3r
* Mobile
* OSINT
* PostExploitation
* Privilege Escalation

  * BeRoot
  * LinEnum
  * Linux Exploit Suggester
  * linuxprivchecker
  * Linux Smart Enumeration
  * JAWS
  * Windows Exploit Suggester NG
  * WindowsEnum
* Recon

  * nmap
  * theHarvester
  * metagoofil
  * recon-ng
  * skiptracer
  * Just-Metadata
  * spiderfoot
* Vulnerability Scan
* Weaponization

  * CVE-2018-20250.git
  * CVE-2017-8759.git
  * CVE-2017-0199.git
  * CVE-2017-8570.git
  * demiguise
  * Malicious Macro Generator
  * DKMC
  * Office DDE Payloads
  * DZGEN
  * EmbedinHTML
  * Macro Pack
* Wireless
