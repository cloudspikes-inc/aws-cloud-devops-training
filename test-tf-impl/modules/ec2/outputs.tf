output "ec2_ip" {
  value = aws_instance.public-ubuntu.public_ip
}

output "pri_ec2_ip" {
  value = aws_instance.public-ubuntu.private_ip
}