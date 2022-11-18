resource "aws_instance" "ubuntu-server" {
    count = 0
    ami = "ami-097a2df4ac947655f"
    instance_type = "t2.micro"
    key_name = "RAMESH"
    security_groups    = ["All Traffic","default"]
    user_data = "${file("./module/ubuntu-httpd.sh")}"
    tags = {
    Name = "Ramesh-Ubuntu"

  }
}
