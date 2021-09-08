FROM kalilinux/kali-bleeding-edge:latest

# main setup and installation
RUN apt update
RUN apt upgrade -y
RUN apt install -y curl netcat-traditional nmap gobuster python3 python3-pip seclists iproute2 dnsutils iputils-ping testssl.sh emacs-nox sqlmap whois nikto wget ssh exploitdb man-db net-tools zsh git hydra w3m commix vim

# Configuration files
COPY conf/.zshrc /root/.zshrc
COPY conf/.vimrc /root/.vimrc
COPY conf/sshd_config /etc/ssh/sshd_config

# Make zsh default shell
RUN chsh -s $(which zsh)

# Some more custom tools
RUN mkdir /root/tools
RUN mkdir /usr/share/wordlists
RUN curl https://getcroc.schollz.com | bash
RUN sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
RUN cd /usr/share/wordlists && git clone https://github.com/cbk914/PayloadsAllTheThings.git

# setup for ssh
RUN echo "root:attack" | chpasswd
EXPOSE 22

# Cleanup
RUN apt autoremove -y
RUN apt autoclean -y
RUN rm /root/.zshrc.pre-oh-my-zsh

# Set working directory
WORKDIR /root/

# aaannnd, done
ENTRYPOINT service ssh start && /bin/zsh
