variable "ec2_ami" {
  description = "The environment value for the current Infrastructure."
  type        = string
}

variable "ec2_instance_type" {
  description = "The environment value for the current Infrastructure."
  type        = string
}

variable "ec2_vpc_security_group_ids" {
  description = "The environment value for the current Infrastructure."
  type        = list(string)
}

variable "ec2_subnet_id" {
  description = "The environment value for the current Infrastructure."
  type        = string
}

variable "ec2_tags_name" {
  description = "The environment value for the current Infrastructure."
  type        = string
}

variable "ec2_tags_project" {
  description = "The environment value for the current Infrastructure."
  type        = string

}

variable "ec2_tags_role" {
  description = "The environment value for the current Infrastructure."
  type        = string

}

variable "ec2_tags_env" {
  description = "The environment value for the current Infrastructure."
  type        = string

}

variable "ec2_tags_mgd_by" {
  description = "The environment value for the current Infrastructure."
  type        = string

}

variable "ec2_kp_name" {
  description = "The KP Name for the current EC2 Instance."
  type        = string
}
