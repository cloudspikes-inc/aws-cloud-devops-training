terraform {
  backend "s3" {
    bucket         = "test-cloud-devops-terraform-state-backend"
    key            = "terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "tf_state_db_wr7f6w7"
    encrypt        = true
  }
}
