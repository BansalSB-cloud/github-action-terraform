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
  subnet_id              = aws_subnet.public_1.id
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

  tags = {
    Name = "Public_EC2"
  }
}