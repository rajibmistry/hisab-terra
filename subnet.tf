# Creating 1st subnet 
resource "aws_subnet" "hisab-subnet" {
  vpc_id                  = aws_vpc.hisab-vpc.id
  cidr_block              = var.subnet_cidr
  map_public_ip_on_launch = true
  # availability_zone       = "ap-southeast-1"
  tags = {
    Name = "Demo subnet"
  }
}