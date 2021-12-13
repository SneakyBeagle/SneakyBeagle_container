FROM kalilinux/kali-bleeding-edge:latest
ARG SSHPASSWORD

# main setup and installation
RUN apt-get update && \
    apt-get install -y curl netcat-traditional nmap gobuster python3 python3-pip iproute2 dnsutils iputils-ping emacs-nox sqlmap whois nikto wget ssh net-tools git nfs-common tcpdump seclists

# Configuration files
COPY files/.vimrc /root/.vimrc
COPY files/.bashrc /root/.bashrc
COPY files/sshd_config /etc/ssh/sshd_config

## UNCOMMENT TO INSTALL OPTIONAL
#COPY files/install_optional.sh /root/install_optional.sh
#RUN chmod +x /root/install_optional.sh && /root/install_optional.sh && rm /root/install_optional.sh

# Some more custom tools
RUN mkdir /root/tools && \
    mkdir /usr/share/wordlists && \
    curl https://getcroc.schollz.com | bash

# setup for ssh (change password ASAP)
RUN (echo "root:$SSHPASSWORD" | chpasswd) && \
    service ssh start
EXPOSE 22

# upgrade packages (Currently unused, since this makes the build time very long)
#RUN apt-get upgrade -y

# Cleanup
RUN touch /root/.hushlogin && \
    apt-get autoremove -y && \
    apt-get autoclean -y

# aaannnd, done
CMD ["/usr/sbin/sshd", "-D"]
