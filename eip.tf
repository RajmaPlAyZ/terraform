resource "aws_eip" "master_eip" {
  instance = aws_instance.ec2.id
  vpc      = true
}
