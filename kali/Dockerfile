FROM kalilinux/kali-bleeding-edge:latest 
LABEL author="SneakyBeagle"
LABEL description="Container for Kali Linux"
ARG SSHPASSWORD

# main setup and installation
RUN apt-get update && apt-get install -y apt-utils curl netcat-traditional \
    nmap gobuster python3 python3-pip iproute2 dnsutils iputils-ping emacs-nox sqlmap whois \
    nikto wget ssh net-tools git nfs-common tcpdump seclists inetutils-traceroute vim
    

# Configuration files
COPY files/.vimrc /root/.vimrc
COPY files/.bashrc /root/.bashrc
COPY files/.profile /root/.profile
COPY files/sshd_config /etc/ssh/sshd_config

# Scripts

## UNCOMMENT TO INSTALL OPTIONAL
#COPY files/install_optional.sh /root/install_optional.sh
#RUN chmod +x /root/install_optional.sh && /root/install_optional.sh && rm /root/install_optional.sh

# Some more custom tools
<<<<<<< HEAD
RUN mkdir /root/tools && mkdir /usr/share/wordlists && curl https://getcroc.schollz.com | bash
RUN git clone https://github.com/chopicalqui/KaliIntelligenceSuite.git /opt/kaliintelsuite && cd /opt/kaliintelsuite && pip3 install -r requirements.txt && \
    python3 -m pip install cachecontrol httpx[cli] && export POETRY_VIRTUALENVS_IN_PROJECT=true && export POETRY_VIRTUALENVS_PATH=/opt/kaliintelsuite/.venv/ && \
    poetry install --no-root --no-dev 
#   /opt/kaliintelsuite/kis/kismanage.py database --setup && kismanage database --test
=======
RUN mkdir /root/tools && mkdir /usr/share/wordlists
#RUN curl https://getcroc.schollz.com | bash
RUN pip install httpx[cli]
>>>>>>> cd61a01c2fd0a77fe65a75d954cc319d3faa5aed

# Set bash as default
RUN chsh -s /bin/bash

# Scripts
RUN mkdir /root/scripts
COPY files/*.sh /root/scripts/
<<<<<<< HEAD
=======
RUN chmod +x /root/scripts/*.sh

# setup for ssh
RUN echo "root:$SSHPASSWORD" | chpasswd
RUN service ssh start
EXPOSE 22
>>>>>>> cd61a01c2fd0a77fe65a75d954cc319d3faa5aed

# Cleanup
RUN touch /root/.hushlogin && apt-get autoremove -y && apt-get autoclean -y

# aaannnd, done
CMD ["/usr/sbin/sshd", "-D"]