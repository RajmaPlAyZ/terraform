variable "region" {
  default = "ap-south-1"
  
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "pub_sub" {
  type    = list(any)
  default = ["10.0.2.0/24", "10.0.3.0/24", "10.0.4.0/24","10.0.5.0/24"]
}

variable "priv_sub" {
  type    = list(any)
  default = ["10.0.6.0/24", "10.0.7.0/24", "10.0.8.0/24","10.0.9.0/24"]
}

# variable "azs" {
#   type    = list(any)
#   default = ["us-west-2a", "us-west-2b", "us-west-2c"]
# }


# Declare the data source
data "aws_availability_zones" "azs" {}


variable "ec2_ami" {
  type = map
  default = {
     ap-south-1 = "ami-0287a05f0ef0e9d9a"
  }
}

variable "instancetype" {
     default = "t2.micro"
}

variable "key_name" {
  default = "rajma"
  
}
