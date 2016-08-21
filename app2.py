#!/usr/bin/python


#Se importa el cliente docker.
from docker import Client
from io import BytesIO
dockerfile = '''
 # Shared Volume
 FROM busybox
 MAINTAINER Ernesto Crespo, ecrespo@gmail.com
 VOLUME /data
 CMD ["/bin/sh"]
 '''
f = BytesIO(dockerfile.encode('utf-8'))
cli = Client(base_url='unix://var/run/docker.sock')
response = [line for line in cli.build(
	fileobj=f, rm=True, tag='yourname/volume'
 )]

for i in response:
	print (i)

print (cli.containers())