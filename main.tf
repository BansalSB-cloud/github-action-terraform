
resource "aws_s3_bucket" "my_bucket" {
  bucket        = "${var.bucket_name}-${random_id.rand.hex}"
  force_destroy = true
}

resource "random_id" "rand" {
  byte_length = 4
}

#Deploy an IAM Role with PowerUserIAMPolicy
#Deploy an RDS Instance

resource "aws_instance" "public_ec2" {
  ami                    = var.ec2_ami
  instance_type          = var.instance_type
  key_name               = var.ec2_key_pair
  subnet_id              = data.aws_ssm_parameter.resources["subnet1_id"].value
  vpc_security_group_ids = [data.aws_ssm_parameter.resources["ec2_sg_id"].value]
     tags = {
       Name = "Public_EC2"
     }
   }