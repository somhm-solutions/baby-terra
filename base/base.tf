/* Base Config */

provider "aws"{
    shared_credentials_file = "~/.aws/credentials"
    region     = "us-east-2"
}

resource "aws_instance" "base" {
    ami = "ami-00c03f7f7f2ec15c3"
    instance_type = "t2.micro"
}

resource "aws_eip" "base" {
	instance = "${aws_instance.base.id}"
}

