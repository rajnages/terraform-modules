cidr_block       = "10.0.0.0/16"
private_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
public_subnets   = ["10.0.3.0/24", "10.0.4.0/24"]
# enable_nat_gw    = true
availability_zones = ["us-east-1a", "us-east-1b"]
vpc_name = "terraform"