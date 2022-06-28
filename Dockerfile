FROM node:14.17.0-slim

RUN  mkdir -p /usr/share/man/man1 && \
    echo 'deb http://ftp.debian.org/debian stretch-backports main' | tee /etc/apt/sources.list.d/stretch-backports.list && \
    apt update && apt install -y \
    git \
    ca-certificates \
    openjdk-11-jre \
    curl \
    wget \
    procps

RUN npm i -g @nestjs/cli@8.2.5 npm@8.5.5

ENV JAVA_HOME="/usr/lib/jvm/java-11-openjdk-amd64"

USER node

WORKDIR /home/node/app

CMD [ "tail", "-f", "/dev/null" ]