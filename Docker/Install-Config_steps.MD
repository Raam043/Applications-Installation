Prerequisites:
1. EC2 Server
2. DockerHub account 
   **[My DockerHub Account](https://hub.docker.com/u/raam043)**


# Installing docker on AWS Server
```sh
yum udpate -y
yum install docker -y
systemctl enable docker
systemctl start docker
yum install pip -y
pip install docker-py
```

Create docker working directory
```sh
cd /opt
mkdir docker
cd docker
```

# Dockerfile and Image build
Add `index.html` file to same directory and run Dockerfile

```sh
vi Dockerfile
```

Dockerfile contents


`NGINX`
```sh
FROM ubuntu
RUN apt-get update
RUN apt-get install nginx -y
COPY index.html /var/www/html/
EXPOSE 80
CMD ["nginx","-g","daemon off;"]
```

`TOMCAT` 
```SH
FROM tomcat
RUN mkdir /usr/local/tomcat/webapps/RRR
COPY index.html /usr/local/tomcat/webapps/RRR
EXPOSE 8080
```

`APACHE-HTTPD`
```sh
FROM httpd
COPY index.html /usr/local/apache2/htdocs
EXPOSE 80
```



Now build docker image with aplication (index.html) "." refer for current folder or you can give Dockerfile path instead of "."
```sh
docker build -t <any_name_for_image> .
```
After image creation run list of images to verify
```sh
docker images
```

# Run container with docker image
```sh
docker run --<any_name_for_container> -d -p 80:80 <target_image_name>
```
check container status
```sh
docker ps
```
To run shell commands on conatiner
```sh
docker exec -it <container_id> bash

docker cp index.html <container_id>:/var/www/html
```
To stop containers 
```sh
docker stop <container_id>
```

To delete container 
```sh
docker rm <conatiner_id>
```

# Docker image push to DockerHub 
  You must have DockerHub account to push images
```sh
dokcer login
```
It will ask DockerHub credentials enter it accordingly 
Username:
Password:

After successful login run docker images list and rename it as per you account repo:tag
```sh
docker tag <running_image_name> raam043/nginx

docker push raam043/nginx

## by default it will consider the tag as latest if specifice tags then tags should be mentioned after name "raam043/nginx:v2.0
```
Successfully uploaded...... 😍

Whats next ??    
        Try for CICD using "Jenkins"
