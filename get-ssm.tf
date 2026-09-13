locals {
    ssm_parameters = {
        vpc_id = {
            name = /pragra/project-a/vpc/id
            value = aws_vpc.custom_vpc.id
        }
        publicRT_id = {
            name = /pragra/project-a/publicrt/id
            value = aws_route_table.public_rt.id
        }
        subnet1_id = {
            name = /pragra/project-a/subnet1/id
            value = aws_subnet.subnet1.id
        }
        subnet2_id = {
            name = /pragra/project-a/subnet2/id
            value = aws_subnet.subnet2.id
        }
        subnet3_id = {
            name = /pragra/project-a/subnet3/id
            value = aws_subnet.subnet3.id
        }
        subnet4_id = {
            name = /pragra/project-a/subnet4/id
            value = aws_subnet.subnet4.id
        }
       ec2_sg_id = {
            name = "/pragra/project-a/ec2/sg/id"
            value = aws_security_group.ec2_sg.id
        } 
    }
}

resource "aws_ssm_parameter" "resources" {
  for_each = local.ssm_parameters

  name  = each.value.name
  type  = "String"
  value = each.value.value
}


