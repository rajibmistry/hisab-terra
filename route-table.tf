#Creating Route Table
resource "aws_route_table" "route" {
  vpc_id = aws_vpc.hisab-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.test-gateway.id
  }
  tags = {
    Name = "Route to internet"
  }
}
resource "aws_route_table_association" "route-table" {
  subnet_id      = aws_subnet.hisab-subnet.id
  route_table_id = aws_route_table.route.id
}