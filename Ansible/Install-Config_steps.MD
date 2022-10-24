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
