VPC_PROJECT_NAME = "my-project-demo"

VPC_CIDR_BLOCK                 = "10.10.0.0/16"
VPC_PUBLIC_SUBNET1_CIDR_BLOCK  = "10.10.1.0/24"
VPC_PUBLIC_SUBNET2_CIDR_BLOCK  = "10.10.2.0/24"
VPC_PRIVATE_SUBNET1_CIDR_BLOCK = "10.10.3.0/24"
VPC_PRIVATE_SUBNET2_CIDR_BLOCK = "10.10.4.0/24"


RDS_CIDR                = "0.0.0.0/0"
DB_INSTANCE_CLASS       = "t2.micro"
RDS_ENGINE              = "mysql"
ENGINE_VERSION          = "5.7.17"
BACKUP_RETENTION_PERIOD = "7"
RDS_ALLOCATED_STORAGE   = "20"
PUBLICLY_ACCESSIBLE     = "true"
RDS_USERNAME            = "mysqladmin"
RDS_PASSWORD            = "MySq!123#"


SSH_CIDR_APP_SERVER = "0.0.0.0/0"
SSH_CIDR_WEB_SERVER = "0.0.0.0/0"
USER_DATA_FOR_WEBSERVER = "/home/centos/project1/vpc/data_files/web.sh"
USER_DATA_FOR_APPSERVER = "/home/centos/project1/vpc/data_files/app.sh"
PEM_FILE_WEBSERVERS = "project1"
PEM_FILE_APPSERVERS = "project1"
WEB_SERVER_INSTANCE_TYPE = "t2.micro"
APP_SERVER_INSTANCE_TYPE = "t2.micro"
