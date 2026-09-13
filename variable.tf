variable "aws_region" {
  type        = string
  description = "AWS region to deploy into"
  default     = "ca-central-1"
}

variable "bucket_name" {
  type        = string
  description = "Your Bucketname"
  default     = "pragra-sep-2026-11"
}

variable "ec2_ami" {
  type        = string
  default     = "ami-06af26bdf96183d41"
  description = "Enter EC2 AMI ID"
}

variable "instance_type" {
  type        = string
  default     = "t2.micro"
  description = "Enter EC2 Instance Type"
}

variable "ec2_key_pair" {
  type        = string
  default     = "haruncanada-kp"
  description = "Enter EC2 Key Pair Name"
}

