FROM golang:1-bullseye
label author="SneakyBeagle"
label description="Container for Remote Access"

ARG SSHPASSWORD

RUN mkdir -p /usr/src/quantum_tunnel
WORKDIR /usr/src/quantum_tunnel

ENV packages="ssh net-tools"

RUN apt-get update && apt-get install -y $packages && apt-get upgrade -y

RUN echo "root:$SSHPASSWORD" | chpasswd

COPY files/id_rsa* /root/.ssh/

RUN if [ ! -e "/root/.ssh/id_rsa.pub" ]; then ssh-keygen -t rsa -q -N "" -f "/root/.ssh/id_rsa"; fi

# Add the hosting machine to /etc/hosts to be able to forward to it (Not used by default)
RUN netstat -nr | grep '^0\.0\.0\.0' | awk '{print $2" dockerhost"}' >> /etc/hosts

RUN echo "Copy this to the server" && cat /root/.ssh/id_rsa.pub && sleep 10

RUN go install -v github.com/SneakyBeagle/quantum_tunnel@0.1.1

ENTRYPOINT ["quantum_tunnel", "tunnel"]

