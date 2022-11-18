#! /bin/bash
yum update -y
yum install -y httpd.x86_64
systemctl start httpd.service
systemctl enable httpd.service
wget https://github.com/Raam043/Pipeline-HTML/archive/refs/heads/master.zip
sudo unzip master.zip
sudo mv Pipeline-HTML-master/index.html /var/www/html/index.html
