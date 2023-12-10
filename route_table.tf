resource "aws_route_table" "Public_rtb" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "Public_rtb"
  }
}

resource "aws_route_table" "Private_rtb" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "Private_rtb"
  }
}

resource "aws_main_route_table_association" "main_rtb" {
  vpc_id         = aws_vpc.main.id
  route_table_id = aws_route_table.Public_rtb.id
}

resource "aws_route_table_association" "Public_assoc" {
  count      = length(data.aws_availability_zones.azs.names)
  subnet_id      = element(aws_subnet.public_subnet.*.id, count.index)
  route_table_id = aws_route_table.Public_rtb.id
}

resource "aws_route_table_association" "Private_assoc" {
  count      = length(data.aws_availability_zones.azs.names)
  subnet_id      = element(aws_subnet.priv_subnet.*.id, count.index)
  route_table_id = aws_route_table.Private_rtb.id
}
