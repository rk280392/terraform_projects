resource "aws_launch_configuration" "webserver" {
	image_id = "${data.aws_ami.ubuntu.id}"
	security_groups = ["${aws_security_group.for_web_server.id}"]
	key_name = "${var.PEM_FILE_WEBSERVERS}"
	instance_type = "${var.WEB_SERVER_INSTANCE_TYPE}"
	user_data = "{var.USER_DATA_FOR_WEBSERVER}"
	root_block_device {
		volume_type = "gp2"
		volume_size = "30"
		}
}

resource "aws_launch_configuration" "appserver" {
	image_id = "${data.aws_ami.ubuntu.id}"
	security_groups = ["${aws_security_group.for_app_server.id}"]
	key_name = "${var.PEM_FILE_APPSERVERS}"
	instance_type = "${var.APP_SERVER_INSTANCE_TYPE}"
	user_data = "{var.USER_DATA_FOR_APPSERVER}"
	root_block_device {
		volume_type = "gp2"
		volume_size = "30"
		}
}

