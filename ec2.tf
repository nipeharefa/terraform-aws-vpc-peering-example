# Create first EC2 instance to bar vpc
resource "aws_spot_instance_request" "cheap_worker" {
  ami           = "ami-0c6a29a3e648982d3"
  spot_price    = "0.0053"
  instance_type = "t4g.nano"

  subnet_id = aws_subnet.bar.id

  security_groups = [
    aws_security_group.ingress-ssh-test.id
  ]

  key_name = var.ssh-key

  tags = {
    Name    = "CheapWorkerBar"
    Version = "0.0.1"
  }
}


# Create first EC2 instance to foo vpc
resource "aws_spot_instance_request" "cheap_worker_foo" {
  ami           = "ami-0c6a29a3e648982d3"
  spot_price    = "0.0043"
  instance_type = "t4g.nano"

  subnet_id = aws_subnet.foo.id

  security_groups = [
    aws_security_group.ingress-ssh-test-foo.id
  ]

  key_name = var.ssh-key

  tags = {
    Name    = "CheapWorkerFoo"
    Version = "0.0.1"
  }
}