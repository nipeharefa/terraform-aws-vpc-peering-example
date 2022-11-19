# resource "aws_network_interface" "bar" {
#   subnet_id   = aws_subnet.foo.id

#   tags = {
#     Name = "primary_network_interface"
#   }
# }

# resource "aws_network_interface" "foo" {
#   subnet_id   = aws_subnet.bar.id

#   tags = {
#     Name = "secondary_network_interface"
#   }
# }



# resource "aws_network_interface_attachment" "test" {
#   instance_id          = aws_spot_instance_request.cheap_worker.spot_instance_id
#   network_interface_id = aws_network_interface.bar.id
#   device_index         = 0

#   depends_on = [
#     aws_spot_instance_request.cheap_worker
#   ]
# }