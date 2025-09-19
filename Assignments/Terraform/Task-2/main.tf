provider "aws" {
    region = "us-east-1"
    alias = "Nvirginia"  
}

provider "aws" {
    region = "ap-south-1"
    alias = "Mumbai"
}

resource "aws_instance" "inst-nvirginia"{

    provider = aws.Nvirginia
    ami = var.ami-usa
    instance_type = var.instance_type
    user_data = <<-EOF
                #!/bin/bash
                apt-get update
                apt-get install nginx -y
                systemctl enable nginx 
                systemctl start nginx 
                echo "Hello from nvirginia" > /usr/share/nginx/html/index.html
                EOF
    tags = {
      Name = "inst-nvirginia"
    }
}

resource "aws_instance" "inst-mumbai"{

    provider = aws.Mumbai
    ami = var.ami-asia
    instance_type = var.instance_type
    user_data = <<-EOF
                #!/bin/bash
                apt-get update
                apt-get install nginx -y
                systemctl enable nginx 
                systemctl start nginx 
                echo "Hello from mumbai" > /usr/share/nginx/html/index.html
                EOF
    tags = {
      Name = "inst-mumbai"
    }
}