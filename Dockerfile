FROM jpetazzo/dind
MAINTAINER Ernesto Crespo


USER root


#RUN echo "deb http://ftp.debian.org/debian jessie main contrib non-free" \
#	> /etc/apt/sources.list 

RUN apt-get update 
RUN apt-get install --force-yes -y python-pip
RUN pip install docker-py
RUN useradd dockerpy 
RUN echo "dockerpy ALL=NOPASSWD: ALL" >> /etc/sudoers
RUN gpasswd -a dockerpy docker

ADD . /code/
WORKDIR /code/
RUN chown -R dockerpy.dockerpy  /code



RUN apt-get clean && rm -rf /var/lib/apt/lists/*
RUN service docker start


USER dockerpy
CMD python app.py



