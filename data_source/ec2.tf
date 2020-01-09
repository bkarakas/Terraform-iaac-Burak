# Go to region us-east-2
provider "aws" { 
  region = "us-east-2" 
} 

# Search for ubuntu latest with the owner
data "aws_ami" "ubuntu" { 
  most_recent = true 
  owners = ["099720109477"] 
} 

# Show the AMI id
output "ami" { 
  value = "${data.aws_ami.ubuntu.id}" 
} 