# Release Linux-ec2 instance
  connect to the server
  ```sh
  ssh localhost
  ```
  >>try to check the status (you will get error as permission denied)

  ```sh
  ssh-keygen
  ```
  enter upto key get generated
  It will generate public key
  
  ```sh
  cat /root/.ssh/id_rsa.pub>>/root/.ssh/authorized_keys
  ```
  for copying from id_rsa.pub to authorized_keys
  
  ```sh
  chmod 755 /root/.ssh/authorized_keys
  ```
  [Optional]for giving permissions to that file
  
  ```sh
  cat /root/.ssh/id_rsa.pub>>/home/ec2-user/.ssh/authorized_keys
  ```
  chmod 755 /home/ec2-user/.ssh/authorized_keys
  
  ssh localhost
  
  for checking
# Now Master is set, Create client servers (+2) using AMI

  After creation of AMI - release 1 or 2
  
  try to connect client servers
  
  ssh 3.18.191.237 (new client servers)
  
  sucessfully connected then for for installation of ansible
  
# Now install ansible
  ```sh
  yum update -y
  amazon-linux-extras install ansible2 -y
  yum install java -y
  
  ansible -–version
  ```
  
  ```sh
  vi /etc/ansible/hosts
  ```
  
  add clients server private.ip ( with group name on [] square box)
  
  ```sh
  ansible -m ping rnb-servers
  ```
  
  vi rnb.yml
  ```sh
---
- hosts: webservers 
  become: True
  tasks:
    - name: Install packages
      yum:
        name: "httpd"
        state: "present"
    - name: Start Apache server
      service:
        name: httpd
        state: started
        enabled: True
    - name: Deploy static website
      copy:
        src: index.html
        dest: /var/www/html/
...
```

 run below command 
 ```sh
 ansible-playbook rnb.yml
 ```
 



