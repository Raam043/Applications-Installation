Release Linux-ec2 instance>>>>

connect to the server
ssh localhost
>>try to check the status (you will get error as permission denied)

ssh-keygen
>>enter upto key get generated
>>It will generate public key

cat /root/.ssh/id_rsa.pub>>/root/.ssh/authorized_keys
>>for copying from id_rsa.pub to authorized_keys

chmod 755 /root/.ssh/authorized_keys
>>for giving permissions to that file

cat /root/.ssh/id_rsa.pub>>/home/ec2-user/.ssh/authorized_keys
chmod 755 /home/ec2-user/.ssh/authorized_keys

ssh localhost
>>for checking

##Now Master is set, Create client servers (+2) using AMI
After creation of AMI - release 1 or 2
try to connect client servers  
ssh 3.18.191.237 (new client servers)
>>sucessfully connected then for for installation of ansible

#!/bin/bash
yum update -y
amazon-linux-extras install ansible2 -y
yum install java -y

ansible -–version

vi /etc/ansible/hosts
add clients server private.ip ( with group name on [] square box)

ansible -m ping rnb-servers

vi rnb.yml
_____________________________________________________________________________________-
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
...
___________________________________________________________________________________________
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
_____________________________________________________________________________________


ansible-playbook rnb.yml

if got sucess then test the results.


+++++++++++++Pipeline for Ansible +++++++++++++++++++++++++++++
Install jenkins on Ansible server ( or you can release new jenkins server)

#!/bin/bash
wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
yum upgrade
amazon-linux-extras install java-openjdk11 -y
yum install jenkins -y
systemctl enable jenkins
systemctl start jenkins
yum install git -y

###Open jenkins application and download teh "Ansible plugin"
and confguare ansible path ( Glabal tool configuaration)

Ansible = 
name = ansible2
path = /bin/ansible
-- to know the path of ansible enter command on jenkins+ansible server "which ansible"

Create new project with "Pipeline project"

Pipeline script >>>
___________________________________________________________________________________________
pipeline {
    agent any

    stages {
        stage('SCM checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Raam043/Ansible-App-Test.git'
            }
        }
        stage('Execute Ansible Playbook') {
            steps {
                ansiblePlaybook credentialsId: 'private-key', disableHostKeyChecking: true, installation: 'ansible', inventory: 'dev.inv', playbook: 'apache.yml'
            }
        }
    }
}
_________________________________________________________________________________________

Git repository should be contain "yaml & inv files" to refer Ansible configurations
apache.yml = download and install application
apache.inv = mainatin the inventory of client server's private IP addresses.

