resource "aws_vpc" "terraform_vpc" {
  cidr_block           = var.cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "${var.vpc_name}-${terraform.workspace}"
  }
}

resource "aws_internet_gateway" "terraform_igw" {
  vpc_id = aws_vpc.terraform_vpc.id

  tags = {
    Name = "${var.vpc_name}-igw"
  }
  
}

resource "aws_subnet" "private" {
  count             = length(var.private_subnets)
  vpc_id            = aws_vpc.terraform_vpc.id
  cidr_block        = var.private_subnets[count.index]
  availability_zone = var.availability_zones[count.index]

  tags = merge(
    {
      Name = "${var.vpc_name}-private-${count.index}"
    },
    var.tags
  )
}

resource "aws_subnet" "public" {
  count             = length(var.public_subnets)
  vpc_id            = aws_vpc.terraform_vpc.id
  cidr_block        = var.public_subnets[count.index]
  availability_zone = var.availability_zones[count.index]

  tags = merge(
    {
      Name = "${var.vpc_name}-public-${count.index}"
    },
    var.tags
  )
}

resource "aws_route_table" "terraform_public_rt" {
  vpc_id = aws_vpc.terraform_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.terraform_igw.id
  }

  tags = {
    Name = "${var.vpc_name}-public-rt"
  }

  depends_on = [
    aws_internet_gateway.terraform_igw
  ]
}

resource "aws_route_table" "terraform_private_rt" {
  vpc_id = aws_vpc.terraform_vpc.id

  tags = {
    Name = "${var.vpc_name}-private-rt"
  }
}


resource "aws_route_table_association" "public_association" {
  count          = length(var.public_subnets)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.terraform_public_rt.id
}

resource "aws_route_table_association" "private_association" {
  count          = length(var.private_subnets)
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.terraform_private_rt.id
}