# main.tf - All Terraform Assignments

# ====================
# ASSIGNMENT 1: Basic EC2 in Ohio
# ====================

resource "aws_instance" "assignment1_instance" {
  count = var.enable_assignment1 ? 1 : 0

  ami           = "ami-0b8b44ec9a8f90422"  # Amazon Linux 2023 in Ohio
  instance_type = "t2.micro"
  
  tags = {
    Name    = "assignment1-ohio-instance"
    Assignment = "1"
  }
}

# ====================
# ASSIGNMENT 2: EC2 with Elastic IP
# ====================

resource "aws_instance" "assignment2_instance" {
  count = var.enable_assignment2 ? 1 : 0

  ami           = "ami-0b8b44ec9a8f90422"
  instance_type = "t2.micro"
  
  tags = {
    Name    = "assignment2-instance-with-eip"
    Assignment = "2"
  }
}

resource "aws_eip" "assignment2_eip" {
  count = var.enable_assignment2 ? 1 : 0

  instance = aws_instance.assignment2_instance[0].id

  tags = {
    Name    = "assignment2-elastic-ip"
    Assignment = "2"
  }
}

# ====================
# ASSIGNMENT 3: Multi-Region Instances
# ====================

resource "aws_instance" "assignment3_ohio" {
  count = var.enable_assignment3 ? 1 : 0

  ami           = "ami-0b8b44ec9a8f90422"  # Ohio AMI
  instance_type = "t2.micro"
  
  tags = {
    Name    = "hello-ohio"
    Assignment = "3"
  }
}

resource "aws_instance" "assignment3_virginia" {
  count    = var.enable_assignment3 ? 1 : 0
  provider = aws.virginia

  ami           = "ami-0c02fb55956c7d316"  # Virginia AMI
  instance_type = "t2.micro"
  
  tags = {
    Name    = "hello-virginia"
    Assignment = "3"
  }
}

# ====================
# ASSIGNMENT 4: VPC with EC2 Instance
# ====================

# VPC
resource "aws_vpc" "assignment4_vpc" {
  count = var.enable_assignment4 ? 1 : 0

  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  
  tags = {
    Name    = "assignment4-vpc"
    Assignment = "4"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "assignment4_igw" {
  count = var.enable_assignment4 ? 1 : 0

  vpc_id = aws_vpc.assignment4_vpc[0].id
  
  tags = {
    Name    = "assignment4-igw"
    Assignment = "4"
  }
}

# Public Subnet
resource "aws_subnet" "assignment4_subnet" {
  count = var.enable_assignment4 ? 1 : 0

  vpc_id                  = aws_vpc.assignment4_vpc[0].id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-2a"
  map_public_ip_on_launch = true
  
  tags = {
    Name    = "assignment4-public-subnet"
    Assignment = "4"
  }
}

# Route Table
resource "aws_route_table" "assignment4_rt" {
  count = var.enable_assignment4 ? 1 : 0

  vpc_id = aws_vpc.assignment4_vpc[0].id
  
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.assignment4_igw[0].id
  }
  
  tags = {
    Name    = "assignment4-route-table"
    Assignment = "4"
  }
}

# Route Table Association
resource "aws_route_table_association" "assignment4_rta" {
  count = var.enable_assignment4 ? 1 : 0

  subnet_id      = aws_subnet.assignment4_subnet[0].id
  route_table_id = aws_route_table.assignment4_rt[0].id
}

# Security Group
resource "aws_security_group" "assignment4_sg" {
  count = var.enable_assignment4 ? 1 : 0

  name        = "assignment4-security-group"
  description = "Security group for assignment 4"
  vpc_id      = aws_vpc.assignment4_vpc[0].id
  
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  tags = {
    Name    = "assignment4-security-group"
    Assignment = "4"
  }
}

# EC2 Instance in VPC
resource "aws_instance" "assignment4_instance" {
  count = var.enable_assignment4 ? 1 : 0

  ami                    = "ami-0b8b44ec9a8f90422"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.assignment4_subnet[0].id
  vpc_security_group_ids = [aws_security_group.assignment4_sg[0].id]
  
  tags = {
    Name    = "assignment4-vpc-instance"
    Assignment = "4"
  }
}

# ====================
# ASSIGNMENT 5: EC2 with Apache
# ====================

# User data script for Apache installation
data "cloudinit_config" "assignment5_user_data" {
  count = var.enable_assignment5 ? 1 : 0

  gzip          = false
  base64_encode = false

  part {
    content_type = "text/x-shellscript"
    content      = <<-EOF
      #!/bin/bash
      yum update -y
      yum install -y httpd
      systemctl start httpd
      systemctl enable httpd
      echo "<h1>Hello from Terraform Assignment 5!</h1>" > /var/www/html/index.html
      EOF
  }
}

resource "aws_instance" "assignment5_instance" {
  count = var.enable_assignment5 ? 1 : 0

  ami           = "ami-0b8b44ec9a8f90422"
  instance_type = "t2.micro"
  user_data     = data.cloudinit_config.assignment5_user_data[0].rendered
  
  tags = {
    Name    = "assignment5-apache-instance"
    Assignment = "5"
  }
}

# Write IP address to local file
resource "local_file" "assignment5_ip_file" {
  count = var.enable_assignment5 ? 1 : 0

  content  = aws_instance.assignment5_instance[0].public_ip
  filename = "assignment5_instance_ip.txt"
}