resource "aws_instance" "ec2-ubuntu" {
  ami           = "ami-0ea18256de20ecdfc"
  instance_type = "t2.micro"

  tags = {
      "Name" = "test-tf-import"
  }
}