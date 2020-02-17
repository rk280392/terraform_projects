variable "VPC_PROJECT_NAME" {}

variable "VPC_CIDR_BLOCK" {}
variable "VPC_PUBLIC_SUBNET1_CIDR_BLOCK" {}
variable "VPC_PUBLIC_SUBNET2_CIDR_BLOCK" {}
variable "VPC_PRIVATE_SUBNET1_CIDR_BLOCK" {}
variable "VPC_PRIVATE_SUBNET2_CIDR_BLOCK" {}

variable "RDS_CIDR" {}
variable "DB_INSTANCE_CLASS" {}
variable "RDS_ENGINE" {}
variable "ENGINE_VERSION" {}
variable "BACKUP_RETENTION_PERIOD" {}
variable "RDS_ALLOCATED_STORAGE" {}
variable "PUBLICLY_ACCESSIBLE" {}
variable "RDS_USERNAME" {}
variable "RDS_PASSWORD" {}

variable "SSH_CIDR_APP_SERVER" {}
variable "SSH_CIDR_WEB_SERVER" {}
variable "USER_DATA_FOR_WEBSERVER" {}
variable "PEM_FILE_WEBSERVERS" {}
variable "PEM_FILE_APPSERVERS" {}
variable "WEB_SERVER_INSTANCE_TYPE" {}
variable "APP_SERVER_INSTANCE_TYPE" {}
variable "USER_DATA_FOR_APPSERVER" {}
