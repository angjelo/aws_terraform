provider "aws"{
}

resource "tls_private_key" "this" {
  algorithm = "RSA"
}

module "deployer" {
  source = "terraform-aws-modules/key-pair/aws"

  key_name   = "deployer-a"
  public_key = tls_private_key.this.public_key_openssh
}













