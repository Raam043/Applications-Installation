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
