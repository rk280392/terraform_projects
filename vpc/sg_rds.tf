resource "aws_security_group" "rds-sg" {
	name = "${var.VPC_PROJECT_NAME}-rds-security-group"
	vpc_id = "${aws_vpc.project1.id}"
	ingress {
		from_port = 3306
		to_port = 3306
		protocol = "tcp"
		cidr_blocks = ["${var.RDS_CIDR}"]
	}

	egress {
		from_port = 0
		to_port = 0 
		protocol = "-1"
		cidr_blocks = ["0.0.0.0/0"]

	}
tags = {
	name = "${var.VPC_PROJECT_NAME}-rds-security-group"
}
}
	
