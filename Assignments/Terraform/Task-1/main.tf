provider "aws" {
  region = "us-east-1"
  alias = "NVirginia"
}

provider "aws" {
  region = "ap-south-1"
  alias = "Mumbai"
}

resource "aws_instance" "inst-USA" {
  ami = "ami-0360c520857e3138f"
  instance_type = "t2.micro"
  provider = aws.NVirginia
}

resource "aws_instance" "inst-Asia" {
  ami = "ami-02d26659fd82cf299"
  instance_type = "t2.micro"
  provider = aws.Mumbai
}