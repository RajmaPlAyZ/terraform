provider "aws" {
  region = var.region
}

resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = "main"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main"
  }
}

resource "aws_subnet" "public_subnet" {
  count      = length(data.aws_availability_zones.azs.names)
  vpc_id     = aws_vpc.main.id
  availability_zone = element(data.aws_availability_zones.azs.names, count.index)
  cidr_block = element(var.pub_sub, count.index)
  
  tags = {
    "Name" = "public-Subnet-${count.index+1}"
  }
  
}

resource "aws_subnet" "priv_subnet" {
  count      = length(data.aws_availability_zones.azs.names)
  vpc_id     = aws_vpc.main.id
  availability_zone = element(data.aws_availability_zones.azs.names, count.index)
  cidr_block = element(var.priv_sub, count.index)
  
  tags = {
    "Name" = "private-Subnet-${count.index+1}"
  }
  
}
