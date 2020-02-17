data "aws_ami" "ubuntu" {
	most_recent = "true"
	owners = ["679593333241"]
	filter {
		name = "name"
		values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
	}
	filter {
		name = "virtualization-type"
		values = ["hvm"]
	}
}

output "aws_ami" {
	value = "${data.aws_ami.ubuntu.id}"
}

