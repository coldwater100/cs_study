FROM mcr.microsoft.com/devcontainers/base:ubuntu

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    openjdk-25-jdk \
    wget \
    unzip \
    xfce4 \
    xfce4-goodies \
    tigervnc-standalone-server \
    novnc \
    websockify \
    dbus-x11 \
    xterm \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /opt

# Ghidra 11.3.1 설치
RUN wget -O ghidra.zip \
    https://github.com/NationalSecurityAgency/ghidra/releases/download/Ghidra_11.3.1_build/ghidra_11.3.1_PUBLIC_20250219.zip \
    && unzip ghidra.zip \
    && rm ghidra.zip

COPY start-gui.sh /usr/local/bin/start-gui.sh
RUN chmod +x /usr/local/bin/start-gui.sh

EXPOSE 6080