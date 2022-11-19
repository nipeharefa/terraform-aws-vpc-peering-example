resource "aws_vpc_peering_connection" "foo_to_bar" {
  peer_owner_id = var.owner_id
  peer_vpc_id   = aws_vpc.foo.id
  vpc_id        = aws_vpc.bar.id
  auto_accept   = true

  tags = {
    Name = "VPC Peering between foo and bar"
  }
}


resource "aws_vpc_peering_connection" "foo_to_internet" {
  peer_owner_id = var.owner_id
  peer_vpc_id   = aws_vpc.foo.id
  vpc_id        = aws_vpc.internet_nat.id
  auto_accept   = true

  tags = {
    Name = "VPC Peering between foo and Internet"
  }
}