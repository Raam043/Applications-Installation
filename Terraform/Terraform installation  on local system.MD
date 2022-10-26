# Terraform installation on local Windows system
  download the terrafrom from official website https://www.terraform.io/downloads.html
  
  unzip the file and save it into program files folder or C drive with naming the folder as terraform
  
# Set the Environmental variables
  Control panel -> system -> advanced system settings -> Environmental variables\
  
  Click new under system Variables Name=Terraform Path=C:\programme files\terraform
  
  open command prompt and check 
  
  terraform --version
  
  it will display terraform version

# Create new working directory for terraform 
  Desktop/terraform
  
  add configuration files into folder
  
  Main.tf, variables.tf and test.tfvars ( these three files are must and should)
  
  in addition you can add based on your service required like = s3.tf, ec2.tf, rds.tf, sns.tf .......
  
