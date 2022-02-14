FROM kalilinux/kali-bleeding-edge:latest 
LABEL author="SneakyBeagle"
LABEL description="Container for Kali Linux"
ARG SSHPASSWORD
ARG VOLUME="/root/persistent"

# PACKAGES #
ARG packages="ssh apt-utils wget curl netcat-traditional nmap\
    gobuster python3 python3-pip iproute2 dnsutils iputils-ping emacs-nox sqlmap whois\
    nikto  net-tools git nfs-common tcpdump seclists inetutils-traceroute vim golang-go"
# END PACKAGES #

# main setup and installation
RUN (apt-get update && apt-get install -y $packages) || echo "Update failed"

# Configuration files
COPY files/.vimrc /root/.vimrc
COPY files/.bashrc /root/.bashrc
COPY files/.profile /root/.profile
COPY files/sshd_config /etc/ssh/sshd_config

# Scripts

## UNCOMMENT TO INSTALL OPTIONAL or install later (scripts are copied onto the container)
#COPY files/install_optional.sh /root/install_optional.sh
#RUN chmod +x /root/install_optional.sh && /root/install_optional.sh && rm /root/install_optional.sh

# Some more custom tools

RUN mkdir /root/tools && mkdir /usr/share/wordlists
#RUN curl https://getcroc.schollz.com | bash
RUN (pip install httpx[cli] && pip install nwrapy) || echo "pip installs failed"

RUN (go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest &&\
    /root/go/bin/nuclei -ut &&\
    go install -v github.com/glebarez/cero@latest) || echo "go installs failed"


# Set bash as default
RUN chsh -s /bin/bash

# Scripts
RUN mkdir /root/scripts
COPY files/*.sh /root/scripts/
RUN chmod +x /root/scripts/*.sh

# setup for ssh
RUN echo "root:$SSHPASSWORD" | chpasswd
RUN if [ ! -e "/usr/sbin/sshd" ]; then apt install -y ssh; fi
RUN if [ ! -e "$VOLUME/authorized_keys" ]; then cp $VOLUME/authorized_keys /root/.ssh/authorized_keys; fi
RUN service ssh start
EXPOSE 22

# Cleanup
RUN touch /root/.hushlogin && apt-get autoremove -y && apt-get autoclean -y

# aaannnd, done
CMD ["/usr/sbin/sshd", "-D"]
