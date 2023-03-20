# Getting Public IP of EC2 instance
output "public_ip_1" {
  value = aws_instance.demo_instance_public_1.public_ip
}

# Getting ID of EC2 instance
output "instance_id_1" {
  value = aws_instance.demo_instance_public_1.id
}
