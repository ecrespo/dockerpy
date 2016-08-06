FROM debian
MAINTAINER Ernesto Crespo

USER root

RUN echo "deb http://ftp.debian.org/debian jessie main contrib non-free" \
	> /etc/apt/sources.list 

RUN apt-get update 
#RUN apt-get upgrade -y --force-yes
RUN apt-get install -y python python-pip


RUN echo "deb http://apt.dockerproject.org/repo debian-jessie main" \
	> /etc/apt/sources.list.d/docker.list \
	&& apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 \
	--recv-keys 58118E89F3A912897C070ADBF76221572C52609D \
	&& apt-get update \
	&& apt-get install -y apt-transport-https \
	&& apt-get install -y sudo \
	&& apt-get install -y docker-engine

RUN pip install docker-py


RUN useradd dockerpy 


RUN apt-get clean && rm -rf /var/lib/apt/lists/*

RUN echo "dockerpy ALL=NOPASSWD: ALL" >> /etc/sudoers
USER dockerpy



