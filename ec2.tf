
# resource "aws_instance" "app_server" {
#   ami           = "ami-0b97f88dc44d34c00"
#   instance_type = "t2.micro"

#   tags = {
#     Name = "EC2DeployedFromTerraform"
#   }
# }

# resource "aws_instance" "EC2_VM" {
#   ami           = "ami-03f4878755434977f"
#   instance_type = "t2.micro"

#   tags = {
#     Name = "SecondEC2ByTerraforms"
#   }
# }