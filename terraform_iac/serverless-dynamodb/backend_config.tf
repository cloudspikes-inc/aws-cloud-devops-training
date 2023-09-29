terraform {
  backend "s3" {
    bucket         = "terraform-state-backend-4958t45wc0"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform_state_db_4958t45wc0"
    encrypt        = true
  }
}
