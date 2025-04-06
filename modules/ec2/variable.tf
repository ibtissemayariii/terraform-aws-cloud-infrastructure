variable "vpc_id" {
  description = "The VPC ID"
  type        = string
}

variable "public_subnet_id" {
  description = "The subnet ID for public EC2 instances"
  type        = string
}

variable "private_subnet_id" {
  description = "The subnet ID for private EC2 instances"
  type        = string
}

variable "ami_id" {
  description = "The AMI ID for EC2 instances"
  type        = string
}

variable "key_name" {
  description = "The name of the SSH key pair to access the EC2 instances"
  type        = string
}
