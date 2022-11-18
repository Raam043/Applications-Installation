#! /bin/bash
yum update -y
amazon-linux-extras install nginx1.12 -y
service nginx start
wget https://github.com/Raam043/Pipeline-HTML/archive/refs/heads/master.zip
sudo unzip master.zip
sudo mv Pipeline-HTML-master/index.html /usr/share/nginx/html/
