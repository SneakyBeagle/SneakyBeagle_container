FROM kalilinux/kali-bleeding-edge:latest
ARG password

# main setup and installation
RUN password=$password
RUN apt-get update
RUN apt-get install -y curl netcat-traditional nmap gobuster python3 python3-pip seclists iproute2 dnsutils iputils-ping emacs-nox sqlmap whois nikto wget ssh net-tools git nfs-common tcpdump
# Extra packages

# Configuration files
COPY conf/.vimrc /root/.vimrc
COPY conf/.bashrc /root/.bashrc
COPY conf/sshd_config /etc/ssh/sshd_config

## UNCOMMENT TO INSTALL OPTIONAL
#COPY conf/install_optional.sh /root/install_optional.sh
#RUN chmod +x /root/install_optional.sh && /root/install_optional.sh && rm /root/install_optional.sh

# Some more custom tools
RUN mkdir /root/tools
RUN mkdir /usr/share/wordlists
RUN curl https://getcroc.schollz.com | bash

# setup for ssh (change password ASAP)
RUN echo "root:$password" | chpasswd
EXPOSE 22

# upgrade packages
#RUN apt-get upgrade -y

# Cleanup
RUN touch /root/.hushlogin
RUN apt-get autoremove -y
RUN apt-get autoclean -y

# Set working directory
WORKDIR /root/

# aaannnd, done
#CMD ["service", "ssh", "start"]
CMD ["/usr/sbin/sshd", "-D"]
