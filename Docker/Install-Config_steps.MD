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
```

# Dockerfile and Image build
```sh
vi Dockerfile
```

Dockerfile content 

```sh
FROM ubuntu
RUN apt-get update
RUN apt-get install nginx -y
COPY index.html /var/www/html/
EXPOSE 80
CMD ["nginx","-g","daemon off;"]
```

Add `index.html` file to same directory

Now build docker image with aplication (index.html)
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
