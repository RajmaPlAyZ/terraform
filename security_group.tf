
resource "aws_security_group" "ec2-sg" {
  name        = "ec2-sg"
  description = "allow ssh"
  vpc_id      = aws_vpc.main.id

  ingress {
    description      = "ssh from ec2-sg "
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
    ingress {
    description      = "api"
    from_port        = 6443
    to_port          = 64443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "EC2-sg"
  }
}


