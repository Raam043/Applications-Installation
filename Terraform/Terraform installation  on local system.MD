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
  
  Terraform variables = test.tfvars, Qa.tfvars and prod.tfvars
  
  Main.tf, variables.tf and test.tfvars ( these three files are must and should)
  
  in addition you can add based on your service required like = s3.tf, ec2.tf, rds.tf, sns.tf .......
  
# Run the terraform commands on cmd to set infrastructure as code
  ```sh
  terraform init
  terraform plan -var-file=test.tfvars
  terraform apply -var-file=test.tfvars -auto-approve
  ```
  
  if all gets success check on aws > VPC ( it will create new VPC based key given on test.tfvars )
  
  To need one more vpc add "tfvars" file = QA.tfvars
  
  now add ec2.tf and run below command to release servers
  
  ```sh
  terraform apply -var-file=ec2.tf -auto-approve
  ```
  
  Change the numbers or name or othere details and run it again it will reflact on AWS
  
  To delete ec2 instances run below command
  
  ```sh
  terraform apply -destroy -var-file=ec2.tf -auto-approve
  ```
  
  To delete VPC 
  
  ```sh
  terraform apply -destroy -var-file=ec2.tf -auto-approve
  ```
