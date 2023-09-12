output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "vpc_cidr" {
  value = aws_vpc.vpc.cidr_block
}

output "vpc_public_subnets_id" {
  value = aws_subnet.public.id
}

output "vpc_public_subnets_cidr" {
  value = aws_subnet.public.cidr_block
}

output "vpc_private_subnets_id" {
  description = "Private subnet id value."
  value       = aws_subnet.private.id
}

output "vpc_private_subnets_cidr" {
  value = aws_subnet.private.cidr_block
}

output "vpc_default_sg_id" {
  value = aws_security_group.default.id
}