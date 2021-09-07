FROM kalilinux/kali-bleeding-edge:latest

# main setup and installation
RUN apt update
RUN apt upgrade -y
RUN apt install -y curl netcat-traditional nmap gobuster python3 python3-pip seclists iproute2 dnsutils iputils-ping testssl.sh emacs-nox sqlmap whois nikto wget ssh exploitdb man-db net-tools zsh git hydra w3m commix vim

# Configuration files
COPY conf/.zshrc /root/.zshrc
COPY conf/.vimrc /root/.vimrc
COPY conf/sshd_config /etc/ssh/sshd_config

# Some more custom tools
RUN mkdir /root/tools
RUN curl https://getcroc.schollz.com | bash
RUN sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
#RUN $ git clone https://github.com/commixproject/commix.git /root/tools/commix

# Enable ssh
RUN echo "root:attack" | chpasswd
#RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
#RUN service ssh start
EXPOSE 22

# Cleanup
RUN apt autoremove -y
RUN apt autoclean -y
RUN rm /root/.zshrc.pre-oh-my-zsh

# Set working directory
WORKDIR /root/

# aaannnd, done
ENTRYPOINT service ssh start && /bin/zsh
