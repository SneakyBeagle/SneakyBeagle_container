FROM kalilinux/kali-bleeding-edge:latest

# main setup and installation
RUN apt-get update
RUN apt-get install -y curl netcat-traditional nmap gobuster python3 python3-pip seclists iproute2 dnsutils iputils-ping testssl.sh emacs-nox sqlmap whois nikto wget ssh net-tools zsh git hydra commix vim golang-go mydumper nfs-common tcpdump
# Extra packages
#RUN apt-get install -y man-db w3m exploitdb smbclient dsniff

# Configuration files
COPY conf/.zshrc /root/.zshrc
COPY conf/.vimrc /root/.vimrc
COPY conf/.bashrc /root/.bashrc
COPY conf/sshd_config /etc/ssh/sshd_config

# Make zsh default shell
RUN chsh -s $(which zsh)

# Some more custom tools
RUN mkdir /root/tools
RUN mkdir /usr/share/wordlists
RUN curl https://getcroc.schollz.com | bash
RUN sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
RUN cd /usr/share/wordlists && git clone https://github.com/swisskyrepo/PayloadsAllTheThings.git

# Nessus
RUN wget https://www.tenable.com/downloads/api/v1/public/pages/nessus/downloads/15327/download?i_agree_to_tenable_license_agreement=true -O /root/Nessus.deb
RUN dpkg -i /root/Nessus.deb
RUN rm /root/Nessus.deb
#RUN /bin/systemctl start nessusd.service
#RUN service nessusd start
#RUN /opt/nessus/sbin/nessus-service &
EXPOSE 8834

# setup for ssh (change password ASAP)
RUN echo "root:attack" | chpasswd
EXPOSE 22

# upgrade packages
RUN apt-get upgrade -y

# Cleanup
RUN touch /root/.hushlogin
RUN apt-get autoremove -y
RUN apt-get autoclean -y
RUN rm /root/.zshrc.pre-oh-my-zsh

# Set working directory
WORKDIR /root/

# aaannnd, done
ENTRYPOINT service ssh start && (/opt/nessus/sbin/nessus-service &) && /bin/zsh
