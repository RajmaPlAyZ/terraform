resource "aws_instance" "ec2" {
   ami = lookup(var.ec2_ami, var.region)
   instance_type = var.instancetype
   subnet_id = aws_subnet.public_subnet.1.id
   vpc_security_group_ids = ["${aws_security_group.ec2-sg.id}"]
   associate_public_ip_address = false
   key_name  = var.key_name
   user_data = <<-EOF
    #!/bin/bash
    sudo apt-get update
    sudo apt-get install -y git
    sudo git clone https://github.com/RajmaPlAyZ/jenkins-lab.git /home/ubuntu/deployment
    sudo apt-get install -y ansible
    ansible-playbook /home/ubuntu/deployment/deployment.yml >> /home/ubuntu/out.txt
    sudo apt-get install -y software-properties-common
    sudo apt-add-repository --yes --update ppa:ansible/ansible
    sudo apt-get install -y ansible
    sudo apt-get install -y terraform
    EOF

   tags = {
     Name = "Master-Jenkins-${var.region}"
  }
}



#resource "aws_instance" "ec2_worker1" {
#   ami = lookup(var.ec2_ami,var.region)
#   instance_type = var.instancetype
#   subnet_id = aws_subnet.public_subnet.1.id
#   vpc_security_group_ids = ["${aws_security_group.ec2-sg.id}"]
#   associate_public_ip_address = "true"
#   key_name  = var.key_name
#
#
#   tags = {
#     Name = "Worker-${var.region}"
#  }
# }

# resource "aws_instance" "ec2_worker2" {
#    ami = lookup(var.ec2_ami,var.region)
#    instance_type = var.instancetype
#    subnet_id = aws_subnet.public_subnet.1.id
#    vpc_security_group_ids = ["${aws_security_group.ec2-sg.id}"]
#    associate_public_ip_address = "true"
#    key_name  = var.key_name

   
#    tags = {
#      Name = "Worker2-${var.region}"
#   }
#  }
