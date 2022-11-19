variable "access_key" {}
variable "secret_key" {}
variable "region" {
    default = "us-east-2"
}
variable "ami_id" {
    default = {
        us-east-2 = "ami-0beaa649c482330f7"
        us-east-1 = "ami-097a2df4ac947655f"
    }
  
}