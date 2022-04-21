# Defining Public Key
variable "public_key" {
  default = "test.pub"
}
# Defining Private Key
variable "private_key" {
  default = "test.pem"
}
# Definign Key Name for connection
variable "key_name" {
  default = "test"
}
# Defining CIDR Block for VPC
variable "vpc_cidr" {
  default = "10.0.0.0/16"
}
# Defining CIDR Block for Subnet
variable "subnet_cidr" {
  default = "10.0.1.0/24"
}