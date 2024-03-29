/* Base Config */

provider "aws"{
    shared_credentials_file = "${var.credentials_path}"
    region     = "${var.region}"
}

resource "aws_instance" "base" {
    ami = "${var.ami}"
    instance_type = "t2.micro"
#    vpc_security_group_ids = ["${var.vpc_security_group_ids}"]
}

resource "aws_eip" "base" {
	instance = "${aws_instance.base.id}"
#    vpc = true
}

