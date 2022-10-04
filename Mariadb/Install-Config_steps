#!/bin/bash
yum update -y
yum install mariadb-server -y
systemctl start mariadb
systemctl enable mariadb

mysql_secure_installation
> skip for current password
> set root password (Y/n)? Y
> ramesh123
> ramesh123
> Remove anonymous users? (Y/n) ? Y
> Disallow root login remotely? [Y/n] Y
> Remove test database and access to it? [Y/n] Y
> Reload privilege tables now? [Y/n] Y

systemctl restart mariadb

mysql -uroot -p;
=pass> ramesh123
> show databases;

CREATE schema ramesh
;
#above symbol for save the database

show databases;

use ramesh;
show tables;
