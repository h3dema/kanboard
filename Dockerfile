FROM ubuntu:18.04 as base

RUN apt-get -y update && apt-get -y upgrade
#RUN apt -y install build-essential
RUN apt-get -y install wget

RUN apt-get -y update
RUN apt-get -y install git apt-utils

RUN apt -y install apache2
RUN apt -y install mysql-server

RUN export DEBIAN_FRONTEND=noninteractive && \
    ln -fs /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime && \
    apt-get install -y tzdata && \
    dpkg-reconfigure --frontend noninteractive tzdata

RUN apt -y install php libapache2-mod-php
RUN apt -y install php-zip php-xml php-json

RUN cd /var/www/html && \
    git clone https://github.com/kanboard/kanboard.git

RUN cat /etc/passwd