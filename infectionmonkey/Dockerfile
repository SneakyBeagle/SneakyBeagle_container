FROM debian:latest AS base
LABEL author="cbk914"
LABEL description="Infection Monkey for continuous pentesting and attack simulation"

ARG MONKEYHOSTPORT

# Configuration files
COPY conf/.vimrc /root/.vimrc
COPY conf/.bashrc /root/.bashrc
COPY conf/.zshrc /root/.zshrc
COPY infection_docker.sh /root/infection_docker.sh

RUN apt update && apt install -y ca-certificates curl gnupg lsb-release
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg && \
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
RUN apt-get install docker-ce docker-ce-cli containerd.io
RUN /root/infection_docker.sh
EXPOSE 5000
