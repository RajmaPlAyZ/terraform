# output "master" {
#   value = aws_instance.ec2.public_ip
# }

output "eip"{
   value = aws_eip.master_eip.public_ip
}

# output "Worker1" {
#   value = aws_instance.ec2_worker1.public_ip
# }

# output "Worker2" {
#    value = aws_instance.ec2_worker2.public_ip
# }
