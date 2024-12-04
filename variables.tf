variable "region" {
  description = "AWS region to deploy resources"
  default     = "us-east-1"
}

variable "cidr_block" {
  description = "CIDR block for the VPC"
}

variable "private_subnets" {
  description = "CIDR blocks for private subnets"
  type        = list(string)
}

variable "public_subnets" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
}