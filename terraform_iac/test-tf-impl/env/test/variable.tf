// EC2 specific Vars

variable "ec2_ami" {
  description = "The environment value for the current Infrastructure."
  type        = string
  default     = "ami-0ea18256de20ecdfc"
}

variable "ec2_instance_type" {
  description = "The environment value for the current Infrastructure."
  type        = string
  default     = "t2.micro"
}

variable "ec2_tags_name" {
  description = "The environment value for the current Infrastructure."
  type        = string
  default     = "cloudspikes-test-private-ubuntu-server"
}

variable "ec2_tags_project" {
  description = "The environment value for the current Infrastructure."
  type        = string
  default     = "cloudspikes.ca"
}

variable "ec2_tags_role" {
  description = "The environment value for the current Infrastructure."
  type        = string
  default     = "ubuntu-ec2-instance"
}

variable "ec2_tags_env" {
  description = "The environment value for the current Infrastructure."
  type        = string
  default     = "test"
}

variable "ec2_tags_mgd_by" {
  description = "The environment value for the current Infrastructure."
  type        = string
  default     = "terraform"
}

variable "pub_ec2_kp_name" {
  description = "The KP Name for the current EC2 Instance."
  type        = string
  default     = "pub_kp"
}

variable "pri_ec2_kp_name" {
  description = "The KP Name for the current EC2 Instance."
  type        = string
  default     = "pri_kp"
}

// VPC Specific Vars

variable "vpc_cidr_range" {
  description = "Defining VPC CIDR range for the network capacity."
  type        = string
  default     = "10.0.0.0/16"
}

// S3 Specific Vars

variable "s3_bucket_name" {
  description = "The s3 bucket name value for the current Infrastructure."
  type        = string
}

variable "s3_tags_name" {
  description = "The environment value for the current Infrastructure."
  type        = string
}

variable "s3_tags_project" {
  description = "The environment value for the current Infrastructure."
  type        = string
}

variable "s3_tags_role" {
  description = "The environment value for the current Infrastructure."
  type        = string
}

variable "s3_tags_env" {
  description = "The environment value for the current Infrastructure."
  type        = string
}

variable "s3_tags_mgd_by" {
  description = "The environment value for the current Infrastructure."
  type        = string
}