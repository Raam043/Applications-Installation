1. Installation steps for Linux
   ```sh
   #!/bin/bash
   yum update -y
   amazon-linux-extras install epel -y
   yum install nagios nrpe nagios-plugins-all -y -y
   chkconfig –level 3 nagios on
   yum install httpd -y
   service httpd start
   chkconfig httpd on
   yum install php
   /usr/sbin/nagios -v /etc/nagios/nagios.cfg
   service nagios status
   service nagios start
   ```
## Now open new tab and paste [server_ip/nagios]
  ```sh
  userid: nagiosadmin
  password: nagiosadmin
  ```


2. Installation steps for ubuntu
  ```sh
  sudo apt-get update
  sudo apt-get install -y autoconf gcc libc6 make wget unzip apache2 php libapache2-mod-php7.4 libgd-dev
  sudo apt-get install openssl libssl-dev -y
  cd /tmp
  wget -O nagioscore.tar.gz https://github.com/NagiosEnterprises/nagioscore/archive/nagios-4.4.6.tar.gz
  tar xzf nagioscore.tar.gz
  cd /tmp/nagioscore-nagios-4.4.6/
  sudo ./configure --with-httpd-conf=/etc/apache2/sites-enabled
  sudo make all
  sudo make install-groups-users
  sudo usermod -a -G nagios www-data
  sudo make install
  sudo make install-daemoninit
  sudo make install-commandmode
  sudo make install-config
  sudo make install-webconf
  sudo a2enmod rewrite
  sudo a2enmod cgi
  sudo ufw allow Apache
  sudo ufw reload
  sudo htpasswd -c /usr/local/nagios/etc/htpasswd.users nagiosadmin
  # add Password for nagiosadmin
  sudo service apache2 restart
  sudo systemctl restart apache2.service
  sudo systemctl start nagios.service
  ```
## Now open new tab and paste [server_ip/nagios]
  ```sh
  userid: nagiosadmin
  password: nagiosadmin (enter customized password)
  ```
