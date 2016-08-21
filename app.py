#!/usr/bin/python


#Se importa el cliente docker.
from docker import Client

cli = Client(base_url='unix://var/run/docker.sock')

print (cli.images(name="debian"))

#se corre la imagen hello-world
container = cli.create_container(image="debian",command='/bin/sleep 30')

#se imprime la informacion del contenedor
print(container)

print (cli.containers())