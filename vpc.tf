resource "aws_vpc" "foo" {
  cidr_block = "10.1.0.0/16"
  tags = {
    Name = "foo"
  }
}

resource "aws_vpc" "bar" {
  cidr_block = "10.2.0.0/16"
  tags = {
    Name = "bar"
  }
}

resource "aws_subnet" "foo" {
  vpc_id     = aws_vpc.foo.id
  cidr_block = "10.1.1.0/24"

  map_public_ip_on_launch = true

  tags = {
    Name = "Foo subnet"
  }
}

resource "aws_subnet" "bar" {
  vpc_id     = aws_vpc.bar.id
  cidr_block = "10.2.1.0/24"

  # map_public_ip_on_launch = true

  tags = {
    Name = "Bar subnet"
  }
}


resource "aws_vpc" "internet_nat" {
  cidr_block = "10.3.0.0/16"
  tags = {
    Name = "internet_nat"
  }
}

# # internet gatway
resource "aws_internet_gateway" "bar-gw" {
  vpc_id = aws_vpc.bar.id

  tags = {
    Name = "${aws_vpc.bar.tags["Name"]}-gw"
  }
}

resource "aws_internet_gateway" "foo-gw" {
  vpc_id = aws_vpc.foo.id

  tags = {
    Name = "${aws_vpc.foo.tags["Name"]}-gw"
  }
}

resource "aws_internet_gateway" "internet-gw" {
  vpc_id = aws_vpc.internet_nat.id

  tags = {
    Name = "${aws_vpc.internet_nat.tags["Name"]}-gw"
  }
}
# # resource "aws_vpc_peering_connection" "foo" {
# #   peer_owner_id = "230246591747"
# #   peer_vpc_id   = aws_vpc.bar.id
# #   vpc_id        = aws_vpc.internet_nat.id
# #   auto_accept   = true

# #   tags = {
# #     Name = "VPC Peering between foo and bar"
# #   }
# # }

# resource "aws_vpc_peering_connection" "foo_to_bar" {
#   peer_owner_id = "230246591747"
#   peer_vpc_id   = aws_vpc.foo.id
#   vpc_id        = aws_vpc.bar.id
#   auto_accept   = true

#   tags = {
#     Name = "VPC Peering between foo and bar"
#   }
# }