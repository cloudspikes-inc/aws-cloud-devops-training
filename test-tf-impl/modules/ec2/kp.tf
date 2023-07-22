resource "tls_private_key" "test_tf_kp" {
  algorithm = "RSA"
}

resource "aws_key_pair" "generated_key" {
  key_name   = var.ec2_kp_name
  public_key = tls_private_key.test_tf_kp.public_key_openssh
  depends_on = [
    tls_private_key.test_tf_kp
  ]
}

resource "local_file" "key" {
  content         = tls_private_key.test_tf_kp.private_key_pem
  filename        = "${var.ec2_kp_name}.pem"
  file_permission = "0400"
  depends_on = [
    tls_private_key.test_tf_kp
  ]
}
