#! /bin/bash
sudo apt-get update -y
sudo apt install nginx -y
sudo apt install unzip -y
wget https://github.com/Raam043/Pipeline-HTML/archive/refs/heads/master.zip
sudo unzip master.zip
sudo mv Pipeline-HTML-master/index.html /usr/share/nginx/html/
