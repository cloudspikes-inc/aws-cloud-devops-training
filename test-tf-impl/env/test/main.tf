# module "vpc" {
#   source         = "../../modules/vpc"
#   vpc_cidr_range = var.vpc_cidr_range
#   ec2_tags_env   = var.ec2_tags_env
# }

# module "ec2_public_server" {
#   source                     = "../../modules/ec2"
#   ec2_ami                    = var.ec2_ami
#   ec2_instance_type          = var.ec2_instance_type
#   ec2_vpc_security_group_ids = [module.vpc.vpc_default_sg_id]
#   ec2_subnet_id              = module.vpc.vpc_public_subnets_id
#   ec2_kp_name                = var.pub_ec2_kp_name
#   ec2_tags_name              = var.ec2_tags_name
#   ec2_tags_project           = var.ec2_tags_project
#   ec2_tags_role              = var.ec2_tags_role
#   ec2_tags_env               = var.ec2_tags_env
#   ec2_tags_mgd_by            = var.ec2_tags_mgd_by
# }

# module "ec2_private_server" {
#   source                     = "../../modules/ec2"
#   ec2_ami                    = var.ec2_ami
#   ec2_instance_type          = var.ec2_instance_type
#   ec2_vpc_security_group_ids = [module.vpc.vpc_default_sg_id]
#   ec2_subnet_id              = module.vpc.vpc_private_subnets_id
#   ec2_kp_name                = var.pri_ec2_kp_name
#   ec2_tags_name              = var.ec2_tags_name
#   ec2_tags_project           = var.ec2_tags_project
#   ec2_tags_role              = var.ec2_tags_role
#   ec2_tags_env               = var.ec2_tags_env
#   ec2_tags_mgd_by            = var.ec2_tags_mgd_by
# }

module "app_s3" {
  source          = "../../modules/s3"
  s3_bucket_name  = var.s3_bucket_name
  s3_tags_name    = var.s3_tags_name
  s3_tags_project = var.s3_tags_project
  s3_tags_role    = var.s3_tags_role
  s3_tags_env     = var.s3_tags_env
  s3_tags_mgd_by  = var.s3_tags_mgd_by
}
