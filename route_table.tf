resource "aws_route_table" "route-bar-to-foo" {
  vpc_id = aws_vpc.bar.id

  route {
    cidr_block                = "10.1.0.0/16"
    vpc_peering_connection_id = aws_vpc_peering_connection.foo_to_bar.id
  }

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.bar-gw.id
  }

  tags = {
    Name = "Bar to Foo"
  }
}

resource "aws_route_table" "route-foo-to-bar" {
  vpc_id = aws_vpc.foo.id

  route {
    cidr_block                = "10.2.0.0/16"
    vpc_peering_connection_id = aws_vpc_peering_connection.foo_to_bar.id
  }

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.foo-gw.id
  }

  tags = {
    Name = "Foo to Bar"
  }
}

resource "aws_main_route_table_association" "foo" {
  vpc_id         = aws_vpc.foo.id
  route_table_id = aws_route_table.route-foo-to-bar.id
}

resource "aws_main_route_table_association" "bar" {
  vpc_id         = aws_vpc.bar.id
  route_table_id = aws_route_table.route-bar-to-foo.id
}
