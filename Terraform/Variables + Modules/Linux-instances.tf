resource "aws_instance" "webserver" {
    count = 1
    ami = "ami-0beaa649c482330f7"
    instance_type = "t2.micro"
    key_name = "RAMESH"
    security_groups    = ["All Traffic","default"]
    user_data = "${file("./module/linux-httpd.sh")}"
    tags = {
    Name = "Ramesh-Linux"

  }
}
output "linux-server-public_ip" {
    value = "aws_instance.webserver.public_ip"
  
}
