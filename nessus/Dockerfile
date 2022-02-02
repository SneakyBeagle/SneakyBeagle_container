FROM tenableofficial/nessus
label author="SneakyBeagle"
label description="Container for Registered Nessus"

ARG ACTIVATION_CODE
ARG USERNAME
ARG PASSWORD
ARG SSHPASSWORD

ENV ACTIVATION_CODE=${ACTIVATION_CODE}
ENV USERNAME=${USERNAME}
ENV PASSWORD=${PASSWORD}

RUN (yum -y update && yum -y upgrade) || echo "Updating failed"

EXPOSE 8834
#CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
