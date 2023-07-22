resource "aws_eip" "eip" {
  domain     = "vpc"
  depends_on = [aws_internet_gateway.igw]

  tags = {
    Name        = "cloudspikes-test-elastic-ip"
    Project     = "cloudspikes.ca"
    Role        = "e-ip"
    Environment = "test"
    ManagedBy   = "terraform"
  }
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.public.id
  depends_on    = [aws_internet_gateway.igw]

  tags = {
    Name        = "cloudspikes-test-nat-gw"
    Project     = "cloudspikes.ca"
    Role        = "nat-gw"
    Environment = "test"
    ManagedBy   = "terraform"
  }
}