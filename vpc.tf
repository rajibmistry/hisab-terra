resource "aws_vpc" "hisab-vpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"
  tags = {
    Name = "Demo VPC"
  }
}