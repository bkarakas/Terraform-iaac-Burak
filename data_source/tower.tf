# Go to region us-east-2
provider "aws" {
region = "us-east-1"
}

# Search for CentOS latest with the owner
data "aws_ami" "centos" {
    filter {
        name = "root-device-type"
        values = ["ebs"]
        }
    filter {
        name   = "name"
        values = ["CentOS Linux 7 x86_64 HVM EBS *"]
        } 
    most_recent = true
    owners = ["679593333241"]
}

# Show the AMI id
output "ami" {
    value = data.aws_ami.centos.id
}

resource "aws_key_pair" "deployer" { 
  key_name   = "deployer" 
  public_key = file("~/.ssh/id_rsa.pub") 
} 

resource "aws_instance" "towerkey" {
  ami           = data.aws_ami.centos.id
  instance_type = "t2.micro"
  key_name = aws_key_pair.towerkey.key_name
  provisioner "remote-exec" {
    connection {
        host        = self.public_ip
        type        = "ssh"
        user        = "centos"
        private_key = file("~/.ssh/id_rsa")
        }
      inline = [
        "sudo yum install -y epel-release",
        ]
    }

  tags = {
    Name = "HelloWorld"
  }
}


resource "aws_route53_record" "tower" { 
  zone_id = "Z1NSGWEPJFDNW" 
  name    = "tower.example.com" 
  type    = "A" 
  ttl     = "300" 
  records = [aws_instance.web.public_ip] 
} 