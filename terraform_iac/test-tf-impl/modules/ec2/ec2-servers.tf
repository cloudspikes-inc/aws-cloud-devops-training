resource "aws_instance" "public-ubuntu" {
  ami                    = var.ec2_ami
  instance_type          = var.ec2_instance_type
  key_name               = aws_key_pair.generated_key.key_name
  vpc_security_group_ids = var.ec2_vpc_security_group_ids
  subnet_id              = var.ec2_subnet_id

  tags = {
    Name        = var.ec2_tags_name
    Project     = var.ec2_tags_project
    Role        = var.ec2_tags_role
    Environment = var.ec2_tags_env
    ManagedBy   = var.ec2_tags_mgd_by
  }
}