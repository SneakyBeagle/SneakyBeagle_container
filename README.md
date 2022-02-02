# SneakyBeagle container
![Kali Build](https://github.com/SneakyBeagle/SneakyBeagle_container/actions/workflows/docker-kali-image.yml/badge.svg)
![Nessus Build](https://github.com/SneakyBeagle/SneakyBeagle_container/actions/workflows/docker-nessus-image.yml/badge.svg)
![Redteam Build](https://github.com/SneakyBeagle/SneakyBeagle_container/actions/workflows/docker-redteam-image.yml/badge.svg)
![Published containers](https://github.com/SneakyBeagle/SneakyBeagle_container/actions/workflows/docker-publish.yml/badge.svg)

Simple docker compose file and Dockerfiles to build a kali container, a Nessus container, a container with a complete toolkit for Red Team operations, and a container with Infection Monkey for continuous pentesting, and attack simulations. Made to simplify deployments during pentests, vulnerability scans and Red Team Campaigns.

Exposes ports 2222, 22222, 5000 and 8834 on the hosting machine. Port 2222 is used to SSH into the kali container, port 22222 is used to SSH into the redteam container and port 8834 is used to expose Nessus. Infection Monkey exposes port 5000. Settings can be changed in the environment file, see [Step 1](#step-1).

# Create containers:

## Step 1:

Copy "env" to ".env".

```
cp env .env
```

Enter (in .env) the Nessus activation code, a username and a password, and a password to ssh into the kali and redteam containers.

As in the following example:

```
 Nessus
ACTIVATION_CODE=AAAA-BBBB-CCCC-DDDD
USERNAME=admin
PASSWORD=awesomepassword
NESSUSHOSTPORT=8834

# SSH
SSHPASSWORD=anotherawesomepassword

# SSH port on host for Kali
SSHHOSTPORT=2222

# SSH port on host for redteam
RTSSHHOSTPORT=22222
```

Optionally, you can also configure the ports that the hosting machine will expose for the services.

### [Optional] Step 1.2:
A number of optional tools can be installed in the Kali container. This is disabled by default to speed up the build, but can be enabled by uncommenting the following lines in the [Kali Dockerfile](kali/Dockerfile):
```
## UNCOMMENT TO INSTALL OPTIONAL
#COPY files/install_optional.sh /root/install_optional.sh
#RUN chmod +x /root/install_optional.sh && /root/install_optional.sh && rm /root/install_optional.sh
```

This script is copied into the container, so even if not used during build, it can be run later on the container directly.

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
docker-compose build nessus # can also be redteam or kali
```

### Note
Instead of building them, you can also download prebuilt images with the following commands (step 3 can be ignored in this case):

The tag should be added based on the latest (or preferred) version found in the [packages](https://github.com/orgs/SneakyBeagle/packages?repo_name=SneakyBeagle_container).
```
docker pull ghcr.io/sneakybeagle/sneakybeagle_container/sneakybeagle_container.sneakykali:<tag>
```
```
docker pull ghcr.io/sneakybeagle/sneakybeagle_container/sneakybeagle_container.sneakyredteam:<tag>
```
```
docker pull ghcr.io/sneakybeagle/sneakybeagle_container/sneakybeagle_container.sneakynessus:<tag>
```

and run them with 

```
docker run ghcr.io/sneakybeagle/sneakybeagle_container/sneakybeagle_container.sneakykali:<tag>
```
```
docker run ghcr.io/sneakybeagle/sneakybeagle_container/sneakybeagle_container.sneakyredteam:<tag>
```
```
docker run ghcr.io/sneakybeagle/sneakybeagle_container/sneakybeagle_container.sneakynessus:<tag>
```

This will result in a setup that uses the credentials and settings that can be found in the example [env](env) file. This means that you should change the credentials as soon as possible and will use the free version of nessus, since no activation code is provided (obviously).

## Step 3:

Depending on what service(s) you want to run, the following commands can be used:

```
docker-compose up -d
```

and running a single container:
```
docker-compose up -d [service] # nessus, kali or redteam
```

The Infection Monkey container is executed by an independent script, located under infectionmonkey/ directory, that downloads required files and executes them.

```
sudo infection_docker.sh
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
- kali intel suite

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
- kali-whoami

# Red Team

Split into categories, each script installs a defined toolkit for all red team phases and attack vectors.
With sometools.sh script you can add some more tools or keep the installed ones updated.

* Anon

  * TOR
  * TORsocks
  * I2P
  * ProxyChains
  * OpenVPN
  * Wireguard
  * TorGhost
* Evasion

  * UACME
  * mortar
* Exfiltration

  * Mistica
  * DNSExfiltration
  * Egress-assess
  * Data Exfiltration Toolkit
  * Powershell-RAT
  * PyExfil
* Exploitation

  * impacket
  * BEEF
  * bettercap
  * Metasploit Framework
  * jok3r Framework
  * CVE-2021-44228 PoC log4j bypass words
  * Log4Shell RCE Exploit
  * AD Enum
* Mobile

  * Mobile Security Framework
* OSINT / Recon

  * TIDoS Framework
  * terra
  * Phoneinfoga
  * Buster
  * pwnedOrNot
  * nmap
  * theHarvester
  * metagoofil
  * recon-ng
  * skiptracer
  * Just-Metadata
  * spiderfoot
  * FinalRecon
  * nmap Automator
  * OsintGram
  * Social Mapper
  * CrossLinked
  * ADRecon
  * Email Harvester
  * tinfoleak
* Phishing

  * Social Engineer Toolkit
  * Phishing Pretexts
  * Phishery
  * ZPhisher
  * King Phiser
  * Evilginx2
  * evil-ssdp
  * FiercePhish
  * GoPhish
  * ReelPhish
  * CredSniper
* PostExploitation

  * Empire Framework 4
  * Starkiller
  * StarFighters
  * Pupy
  * gcat
  * Merlin
  * weevely
  * Powersploit
* Privilege Escalation

  * BeRoot
  * LinEnum
  * Linux Exploit Suggester
  * linuxprivchecker
  * Linux Smart Enumeration
  * JAWS
  * Windows Exploit Suggester NG
  * WindowsEnum
  * Log4j CVE-2021-45046
  * Responder
  * Windows Kernel Exploits
* Vulnerability Scan

  * CVE-2021-44228 Scanner
  * Log4J CVE Detect
  * espoofer
  * Domain Security Scanner
  * dkimsc4n
  * testssl.sh
  * Nuclei
  * Sn1per
* Weaponization

  * CVE-2018-20250
  * CVE-2017-8759
  * CVE-2017-0199
  * CVE-2017-8570
  * demiguise
  * Malicious Macro Generator
  * DKMC
  * Office DDE Payloads
  * DZGEN
  * EmbedinHTML
  * Macro Pack
  * DInjector
  * Unicorn
  * The Backdoor Factory
  * Generate Macro
  * MaliciousMacroMSBuild
  * wePWNise
  * trojanizer
  * Macro Shop
  * EvilClippy
  * donut
  * Icebreaker
  * Evilgrade

# Infection Monkey

Refer to [documentation](https://www.guardicore.com/infectionmonkey/docs/) for further information.
