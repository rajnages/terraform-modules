variable "vpc_name" {}
variable "cidr_block" {}
variable "private_subnets" {
  type = list(string)
}
variable "public_subnets" {
  type = list(string)
}
variable "availability_zones" {
  type = list(string)
}
variable "tags" {
  type    = map(string)
  default = {}
}
