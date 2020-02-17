resource "aws_autoscaling_group" "webserver" {
  name                      = "autscaling-webserver-group"
  max_size                  = 5
  min_size                  = 2
  health_check_grace_period = 300
  health_check_type         = "EC2"
  desired_capacity          = 4
  force_delete              = true
  launch_configuration      = "${aws_launch_configuration.webserver.name}"
  vpc_zone_identifier       = ["${aws_subnet.public_subnet_1.id}", "${aws_subnet.public_subnet_2.id}"]
  target_group_arns         = ["${aws_lb_target_group.web_server_lb_target.arn}"]

}

