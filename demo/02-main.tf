variable "the_list" {
  type = list(string)
  default = [ "120.17.0.0", "120.17.1.0", "120.17.2.0" ]
}

variable "the_value" {
  type = string
  default = "120.17.1.0"
}

# resource "null_resource" "route_check" {
#   count = length(var.the_list)
#   provisioner "local-exec" {
#     command = "echo %'s\n' '${TOT}+1'  >> env_vars.txt"

#     environment = {
#       TOT = 0
#     }
#   }
# }

data "external" "route_check" {
  program = ["bash", "${path.module}/route-check.sh"]

  query = {
    # arbitrary map from strings to strings, passed
    # to the external program as the data query.
    the_list = "${var.the_list}"
    the_value = var.the_value
  }
}

output "routes_list" {
  value = data.external.route_check.result.routes
}

output "route_value" {
  value = data.external.route_check.result.the_value
}

# resource "aws_vpc" "main" {
#   cidr_block = "10.0.0.0/16"
#   tags = {
#     Name = "oo-test-vpc"
#   }
# }

# resource "aws_subnet" "public_1" {
#   vpc_id     = aws_vpc.main.id
#   cidr_block = "10.0.1.0/24"

#   tags = {
#     Name = "oo-test-subnet"
#   }
# }

# resource "aws_subnet" "public_2" {
#   vpc_id     = aws_vpc.main.id
#   cidr_block = "10.0.2.0/24"

#   tags = {
#     Name = "oo-test-subnet"
#   }
# }

# resource "aws_lb" "test" {
#   name               = "test-lb-tf"
#   internal           = false
#   load_balancer_type = "network"
#   subnets            = [aws_subnet.public_1.id, aws_subnet.public_2.id]

# #   enable_deletion_protection = true

#   tags = {
#     Name = "oo-test-lb"
#   }
# }

# resource "aws_vpc_endpoint_service" "example" {
#   acceptance_required        = false
#   network_load_balancer_arns = [aws_lb.test.arn]
# }