resource "aws_db_subnet_group" "rds_subnet_group" {
	name = "${var.VPC_PROJECT_NAME}_db_subnet_group"
	subnet_ids = ["${aws_subnet.private_subnet_1.id}","${aws_subnet.private_subnet_2.id}"]
tags = {
	name = "${var.VPC_PROJECT_NAME}-db-subnet-group"
}
}



resource "aws_db_instance" "my-rds" {
	allocated_storage = "${var.RDS_ALLOCATED_STORAGE}" 
	instance_class = "${var.DB_INSTANCE_CLASS}"
	engine = "${var.RDS_ENGINE}" 
	engine_version = "${var.ENGINE_VERSION}" 
	identifier = "${var.VPC_PROJECT_NAME}-rds-instance"
	username = "${var.RDS_USERNAME}" 
	password  = "${var.RDS_PASSWORD}"
	multi_az = "true"
	vpc_security_group_ids = ["${aws_security_group.rds-sg.id}"]
	publicly_accessible = "true"
	storage_type = "gp2"
	db_subnet_group_name = "${aws_db_subnet_group.rds_subnet_group.name}"
tags = {
	name = "${var.VPC_PROJECT_NAME}-rds-instance"
}
}

output "rds_endpoint" {
	value = "${aws_db_instance.my-rds.endpoint}"
}
