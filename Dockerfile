# Dockerfile
FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y wget unzip lib32gcc-s1 ca-certificates && \
    useradd -ms /bin/bash tml

USER tml
WORKDIR /home/tml

RUN mkdir -p ~/.local/share/Terraria/tModLoader && \
    wget https://github.com/tModLoader/tModLoader/releases/download/v2023.08.3.3/tModLoader.zip -O /tmp/tmod.zip && \
    unzip /tmp/tmod.zip -d ~/.local/share/Terraria/tModLoader && \
    rm /tmp/tmod.zip

WORKDIR /home/tml/.local/share/Terraria/tModLoader

CMD ["./start-tModLoaderServer.sh"]
