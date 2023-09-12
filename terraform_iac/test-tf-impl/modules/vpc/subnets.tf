# Create 1 public subnets for each AZ within the regional VPC
resource "aws_subnet" "public" {

  vpc_id                  = aws_vpc.vpc.id
  availability_zone       = "ca-central-1a"
  map_public_ip_on_launch = true

  # 256 IP addresses each
  cidr_block = "10.0.1.0/24"

  tags = {
    Name        = "cloudspikes-test-public-subnet"
    Project     = "cloudspikes.ca"
    Role        = "public"
    Environment = var.ec2_tags_env
    ManagedBy   = "terraform"
  }
}

# Create 1 private subnets for each AZ within the regional VPC
resource "aws_subnet" "private" {

  vpc_id            = aws_vpc.vpc.id
  availability_zone = "ca-central-1a"

  # 256 IP addresses each
  cidr_block = "10.0.2.0/24"

  tags = {
    Name        = "cloudspikes-test-private-subnet"
    Project     = "cloudspikes.ca"
    Role        = "private"
    Environment = "test"
    ManagedBy   = "terraform"
  }
}