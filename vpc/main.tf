data "aws_availability_zones" "available" {}

resource "aws_vpc" "project1" {
  cidr_block           = "${var.VPC_CIDR_BLOCK}"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  tags = {
    name = "${var.VPC_PROJECT_NAME}"
  }
}


resource "aws_subnet" "public_subnet_1" {
  vpc_id            = "${aws_vpc.project1.id}"
  cidr_block        = "${var.VPC_PUBLIC_SUBNET1_CIDR_BLOCK}"
  availability_zone = "${data.aws_availability_zones.available.names[0]}"
  tags = {
    name = "${var.VPC_PROJECT_NAME}-vpc-public-subnet-1"
  }
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id            = "{aws_vpc.project1.id}"
  cidr_block        = "${var.VPC_PUBLIC_SUBNET2_CIDR_BLOCK}"
  availability_zone = "${data.aws_availability_zones.available.names[1]}"
  tags = {
    name = "${var.VPC_PROJECT_NAME}-vpc-public-subnet-2}"
  }
}

resource "aws_subnet" "private_subnet_1" {
  vpc_id            = "${aws_vpc.project1.id}"
  cidr_block        = "${var.VPC_PRIVATE_SUBNET1_CIDR_BLOCK}"
  availability_zone = "${data.aws_availability_zones.available.names[0]}"
  tags = {
    name = "${var.VPC_PROJECT_NAME}-vpc-private-subnet-1}"
  }
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id            = "${aws_vpc.project1.id}"
  cidr_block        = "${var.VPC_PRIVATE_SUBNET2_CIDR_BLOCK}"
  availability_zone = "${data.aws_availability_zones.available.names[1]}"
  tags = {
    name = "${var.VPC_PROJECT_NAME}-vpc-private-subnet-2}"
  }
}

resource "aws_internet_gateway" "project1_igw" {
  vpc_id = "${aws_vpc.project1.id}"
  tags = {
    name = "${var.VPC_PROJECT_NAME}-vpc-internet-gateway"
  }
}

resource "aws_eip" "nat_eip" {
  vpc        = "true"
  depends_on = [aws_internet_gateway.project1_igw]
}

resource "aws_nat_gateway" "project1_ngw" {
  allocation_id = "${aws_eip.nat_eip.id}"
  subnet_id     = "${aws_subnet.public_subnet_1.id}"
  depends_on    = [aws_internet_gateway.project1_igw]
  tags = {
    name = "${var.VPC_PROJECT_NAME}-vpc-NAT-gateway"
  }
}

resource "aws_route_table" "public" {
  vpc_id = "${aws_vpc.project1.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.project1_igw.id}"
  }
  tags = {
    name = "${var.VPC_PROJECT_NAME}-public-route-table"
  }
}

resource "aws_route_table" "private" {
  vpc_id = "${aws_vpc.project1.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_nat_gateway.project1_ngw.id}"
  }
  tags = {
    name = "${var.VPC_PROJECT_NAME}-private-route-table"
  }
}

resource "aws_route_table_association" "to_public_subnet1" {
  subnet_id      = "${aws_subnet.public_subnet_1.id}"
  route_table_id = "${aws_route_table.public.id}"
}

resource "aws_route_table_association" "to_public_subnet2" {
  subnet_id      = "${aws_subnet.public_subnet_2.id}"
  route_table_id = "${aws_route_table.public.id}"
}

resource "aws_route_table_association" "to_private_subnet1" {
  subnet_id      = "${aws_subnet.private_subnet_1.id}"
  route_table_id = "${aws_route_table.private.id}"
}

resource "aws_route_table_association" "to_private_subnet2" {
  subnet_id      = "${aws_subnet.private_subnet_2.id}"
  route_table_id = "${aws_route_table.private.id}"
}
