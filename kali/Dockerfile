FROM kalilinux/kali-bleeding-edge:latest
ARG SSHPASSWORD

# main setup and installation
RUN apt-get update
RUN apt-get install -y curl netcat-traditional nmap gobuster python3 python3-pip iproute2 dnsutils iputils-ping emacs-nox sqlmap whois nikto wget ssh net-tools git nfs-common tcpdump seclists inetutils-traceroute

# Configuration files
COPY files/.vimrc /root/.vimrc
COPY files/.bashrc /root/.bashrc
COPY files/sshd_config /etc/ssh/sshd_config

## UNCOMMENT TO INSTALL OPTIONAL
#COPY files/install_optional.sh /root/install_optional.sh
#RUN chmod +x /root/install_optional.sh && /root/install_optional.sh && rm /root/install_optional.sh

# Some more custom tools
RUN mkdir /root/tools
RUN mkdir /usr/share/wordlists
RUN curl https://getcroc.schollz.com | bash
RUN pip install httpx[cli]

# Set bash as default
RUN chsh -s /bin/bash

# Scripts
RUN mkdir /root/scripts
COPY files/*.sh /root/scripts/

# setup for ssh (change password ASAP)
RUN echo "root:$SSHPASSWORD" | chpasswd
RUN service ssh start
EXPOSE 22

# upgrade packages
#RUN apt-get upgrade -y

# Cleanup
RUN touch /root/.hushlogin
RUN apt-get autoremove -y
RUN apt-get autoclean -y

# Set working directory
#WORKDIR /root/

# aaannnd, done
CMD ["/usr/sbin/sshd", "-D"]