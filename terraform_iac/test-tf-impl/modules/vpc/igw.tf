resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name        = "cloudspikes-test-igw"
    Project     = "cloudspikes.ca"
    Role        = "igw"
    Environment = "test"
    ManagedBy   = "terraform"
  }
}