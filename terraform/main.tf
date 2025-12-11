provider "aws" {
  region = var.region
}

data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu-minimal/images/hvm-ssd/ubuntu-jammy-22.04-amd64-minimal-20250930"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "flaskops-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["ap-south-1a"]
  public_subnets  = ["10.0.101.0/24"]

}

module "flaskops_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "flaskops-server"
  description = "Security group allowing HTTP (5000) + SSH (22)"
  vpc_id      = module.vpc.vpc_id

  ingress_with_cidr_blocks = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      description = "Allow SSH"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      from_port   = 5000
      to_port     = 5000
      protocol    = "tcp"
      description = "Allow app access on port 5000"
      cidr_blocks = "0.0.0.0/0"
    },
  ]
}

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "flaskops-instance"

  instance_type = "t3.micro"
  ami = data.aws_ami.ubuntu.id
  key_name      = var.key_name
  subnet_id     = module.vpc.public_subnets[0]


  tags = {
    Project   = "FlaskOps"
  }
}
