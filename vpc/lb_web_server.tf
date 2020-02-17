resource "aws_lb" "web_server_lb" {
  name               = "${var.VPC_PROJECT_NAME}-web-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = ["${aws_security_group.for_web_server.id}"]
  subnets            = ["${aws_subnet.public_subnet_1.id}", "${aws_subnet.public_subnet_2.id}"]
}

resource "aws_lb_target_group" "web_server_lb_target" {
  name     = "Target-group-for-front-end"
  port     = 80
  protocol = "HTTP"
  vpc_id   = "${aws_vpc.project1.id}"
}


resource "aws_lb_listener" "web_server" {
  load_balancer_arn = "${aws_lb.web_server_lb.arn}"
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.web_server_lb_target.arn}"
  }
}

output "Web-Server-Load-Balancer-Endpoint" {
  value = "${aws_lb.web_server_lb.dns_name}"
}
