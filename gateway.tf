resource "aws_internet_gateway" "test-gateway" {
  vpc_id = aws_vpc.hisab-vpc.id
}