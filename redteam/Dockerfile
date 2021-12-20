FROM debian:latest AS base
LABEL author="cbk914"
LABEL description="Container for Red Team Campaign"
ARG RTSSHPASSWORD
ARG DEBIAN_FRONTEND=noninteractive

# Configuration files
COPY conf/.vimrc /root/.vimrc
COPY conf/.zshrc /root/.zshrc
COPY conf/sshd_config /etc/ssh/sshd_config

RUN apt-get update && apt-get upgrade -y && apt-get install -y apt-utils python3 python3-dev build-essential python3-pip redis-server terminator curl vim unzip libssl-dev \
    wget gnupg2 postgresql apt-transport-https lsb-release libreadline-dev libpq5 libpq-dev readline-common libsqlite3-dev libpcap-dev subversion \
    git-core autoconf zlib1g-dev libxml2-dev libxslt1-dev libyaml-dev ruby1.9.1 nmap openssh-server zsh && \
# RedTeamToolkit 
mkdir /root/RedTeamToolkit
COPY conf/*.sh /root/RedTeamToolkit/
RUN chmod +x /root/RedTeamToolkit/*.sh

# Python env
RUN ln -s /usr/bin/python3 /usr/bin/python

# setup for ssh (change password ASAP)
#RUN echo "root:$RTSSHPASSWORD" | chpasswd && service ssh start
#EXPOSE 22

# Cleanup
RUN touch /root/.hushlogin && apt-get autoremove -y && apt-get autoclean -y && zsh