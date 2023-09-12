# Create a VPC for the region associated with the AZ
resource "aws_vpc" "vpc" {
  # 65,536 IP addresses
  cidr_block = var.vpc_cidr_range

  tags = {
    Name        = "cloudspikes-test-vpc"
    Project     = "cloudspikes.ca"
    Environment = var.ec2_tags_env
    ManagedBy   = "terraform"
  }
}