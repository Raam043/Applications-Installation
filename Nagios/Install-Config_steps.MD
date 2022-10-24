## Installation steps for Linux
   '''sh
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
   '''
## Now open new tab and paste [server_ip/nagios]
