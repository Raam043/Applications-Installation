#!/bin/bash
sudo apt-get update
sudo apt-get install -y apache2
sudo systemctl start apache2
sudo systemctl enable apache2
sudo apt install unzip
wget https://github.com/Raam043/Pipeline-HTML/archive/refs/heads/master.zip
sudo unzip master.zip
sudo mv Pipeline-HTML-master/index.html /var/www/html/index.html
