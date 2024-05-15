FROM ubuntu:latest

RUN apt-get update && apt-get install -y sudo

ARG USERNAME=user
ARG GROUPNAME=user
ARG UID=1000
ARG GID=1000
ARG PASSWORD=user
RUN groupadd -g $GID $GROUPNAME && \
    useradd -m -s /bin/bash -u $UID -g $GID -G sudo $USERNAME && \
    echo $USERNAME:$PASSWORD | chpasswd && \
    echo "$USERNAME   ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
USER $USERNAME
WORKDIR /home/$USERNAME/

RUN sudo chmod -R 700 /var/cache/apt/archives/partial/
RUN sudo chown -R _apt:root /var/cache/apt/archives/partial/
RUN sudo apt update -y && sudo apt upgrade -y
RUN sudo apt -y install icedtea-netx
RUN sudo sed -i '/^jdk.jar.disabledAlgorithms=/,/^$/ s/.*/jdk.jar.disabledAlgorithms=MD2, RSA keySize < 1024/' "$(find /usr/lib/jvm -name java.security | head -n 1)"
