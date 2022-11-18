provider "aws" {
    region = "us-east-2"
    access_key = ""
    secret_key = ""
    
  
}
resource "aws_instance" "webserver" {
    count = 2
    ami = "ami-0beaa649c482330f7"
    instance_type = "t2.micro"
    key_name = "RAMESH"
    user_data = <<-EOF
#! /bin/bash
yum update -y
yum install -y httpd.x86_64
systemctl start httpd.service
systemctl enable httpd.service
echo "<Body background="https://github.com/Raam043/Pipeline/blob/master/Sai.jpg?raw=true"><body><div align="center"><h1><strong><p style="color:yellow"> Ramesh Biradar </p></strong></h1><h2><p style="color:greenyellow">Welcome to Saikrishna's html World</p></h2><p style="color:green">Call Mr. Ramesh N for enquiries <a href="tel:9902163099"style="color:yellow"><strong>9902163099</strong></a>.</p></style></head><a href="https://github.com/Raam043/Pipeline/blob/master/Sai3.jpeg?raw=true"> <img src="https://github.com/Raam043/Pipeline/blob/master/Sai3.jpeg?raw=true" alt="Image" style="width:300px height:400px" /> </a><a href="https://github.com/Raam043/Pipeline/blob/master/Sai5.jpeg?raw=true"> <img src="https://github.com/Raam043/Pipeline/blob/master/Sai5.jpeg?raw=true" alt="Image" style="width:300px height:400px" /> </a><a href="https://github.com/Raam043/Pipeline/blob/master/Sai6.jpeg?raw=true"> <img src="https://github.com/Raam043/Pipeline/blob/master/Sai6.jpeg?raw=true" alt="Image" style="width:300px height:400px" /> </a>" > /var/www/html/index.html
    EOF
    tags = {
    Name = "Ramesh-Linux"

  }
}
output "public_ip" {
    value = "aws_instance.webserver.public_ip"
  
}
