#  Install & configure Maven build tool on Jenkins
Maven is a code build tool which used to convert your code to an artifact. this is a widely used plugin to build in continuous integration


#### Prerequisites
1. Jenkins server

#### Install java on jenkins
1. Whle installing jenkins java will be installed, if not  please install java with below commands
    ```sh
    amazon-linux-extras install java-openjdk11 -y
    OR
    yum install java -y
    OR
    apt-get install java -y
    ```
#### Install Maven on Jenkins
1. Download maven packages https://maven.apache.org/download.cgi onto Jenkins server. In this case, I am using /opt/maven as my installation directory
 - Link : https://maven.apache.org/download.cgi
    ```sh
     # Creating maven directory under /opt
     mkdir /opt/maven
     cd /opt/maven
     # downloading maven version 3.8.6
     wget http://mirrors.estointernet.in/apache/maven/maven-3/3.8.6/binaries/apache-maven-3.8.6-bin.tar.gz
     tar -xvzf apache-maven-3.8.6-bin.tar.gz
     ```
   OR
   ```sh
   sudo wget http://repos.fedorapeople.org/repos/dchen/apache-maven/epel-apache-maven.repo -O /etc/yum.repos.d/epel-apache-maven.repo
   sudo sed -i s/\$releasever/6/g /etc/yum.repos.d/epel-apache-maven.repo
   sudo yum install -y apache-maven
   mvn –version
    ```
   
1. Setup M2_HOME and M2 paths in .bash_profile of the user and add these to the path variable
   ```sh
   vi ~/.bash_profile
   JAVA_HOME=/usr/lib/jvm/java-11-openjdk-11.0.16.0.8-1.amzn2.0.1.x86_64
   M2_HOME=/opt/maven/apache-maven-3.8.6
   M2=$M2_HOME/bin
   PATH=$PATH:$JAVA_HOME:$M2_HOME:$M2:$HOME/bin
   ```
#### Checkpoint 
1. logoff and login to check maven version
  
    ```sh
    java --version
    mvn --version
    ```
So far we have completed the installation of maven software to support maven plugin on the jenkins console. Let's jump onto Jenkins to complete the remaining steps. 

### Setup maven on Jenkins console
1. Install maven plugin without restart  
  - `Manage Jenkins` > `Jenkins Plugins` > `available` > `Maven Invoker`
  - `Manage Jenkins` > `Jenkins Plugins` > `available` > `Maven Integration`

2. Configure maven path
  - `Manage Jenkins` > `Global Tool Configuration` > `Maven`
  - `Manage Jenkins` > `Global Tool Configuration` > `java`
