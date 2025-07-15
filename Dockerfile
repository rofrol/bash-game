# Dockerfile
FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y \
    man-db neovim curl wget tree \
    jq ripgrep fd-find sed grep findutils \
    coreutils procps iputils-ping traceroute \
    net-tools btop htop xz-utils \
    bash-completion sudo

RUN ln -s $(which fdfind) /usr/local/bin/fd

RUN yes | unminimize

# Create a training user
RUN useradd -ms /bin/bash student && echo "student ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
USER student
WORKDIR /home/student

# Copy start script
COPY --chown=student:student start.sh /home/student/start.sh
RUN chmod +x /home/student/start.sh

CMD ["/home/student/start.sh"]
