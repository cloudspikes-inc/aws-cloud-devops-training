variable "vpc_cidr_range" {
  description = "Defining VPC CIDR range for the network capacity."
  type        = string
}

variable "ec2_tags_env" {
  description = "The environment value for the current Infrastructure."
  type        = string
}