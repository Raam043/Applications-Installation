# Installing docker on linux 
```sh
yum udpate -y
yum install docker -y
systemctl enable docker
systemctl start docker
yum install pip -y
pip install docker-py
```

# create docker working directory
```sh
cd /opt
mkdir docker
cd docker
vi Dockerfile

```

## create docker container
docker create --name nginx_base -p 80:80 nginx:alpine
docker images
docker ps -a
## now start the container using container id
docker start e54c0dad4f0e
## open port 80 using docker host ip for confirmation then create index.html file
vi index.html
## copy the html file to nginx
docker cp index.html nginx_base:/usr/share/nginx/html/index.html
## create image from container
docker commit nginx_base
## check docker images for latest images
docker images
## set name tag to new image
docker tag f0ae81009644 mynginx
## double check - docker images
docker images
## Create image with tag
docker commit nginx_base mynginx
## stop and delete original container
docker stop nginx_base
docker rm nginx_base
## Now run your docker image container 
docker run --name mynginx -d -p 80:80 mynginx
## remove html and run as original werbserver
docker run --name nginx_base --rm -d -p 80:80 nginx:alpine
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++




docker exec -it 3c1059517791 mkdir  webapps/RRR
docker exec -it 3c1059517791 cp webapps/index.html webapps/RRR






















FROM centos:latest
Maintainer Ramesh
RUN "yum" -y install httpd
COPY index.html /var/www/html
EXPOSE 80
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"











vi index.html
<html> ready file </html>

ls
docker images ls

##create / build image
docker build -t mynginx_image1 .
docker run --name mynginx3 -p 80:80 -d mynginx_image1


if wish to push the docker image to docker hub please follow below steps
___________________________________________________________________
docker images ( now you will get the image details)
docker login
userid:raam043
password:

docker tag httpdimage:latest raam043/httpdimage:latest
docker images
docker push raam043/mynginx_image1
_____________________________________________________________________

=======================UBUNTU==========================================





Dockerfile for "nginx" for "ubuntu"
________________________________________
FROM ubuntu
Maintainer Ramesh
RUN apt-get install -y nginx
RUN apt-get clean
EXPOSE 80
CMD ["nginx", "-D", "FOREGROUND"]
___________________________________________

