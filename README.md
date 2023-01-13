# Run an Nginx in a container as an HTTP reverse proxy

### Examples to build image ###
* docker build -t revngt:latest .

### Examples to run container ###
* docker run --restart=always -d -p 25002:81 -e LISTENPORT=81 -e TARGET=http://192.168.100.36:20000/ revngt:latest
* docker run --restart=always -d --network=host -e LISTENPORT=25002 -e TARGET=http://192.168.100.36:20000/ revngt:latest