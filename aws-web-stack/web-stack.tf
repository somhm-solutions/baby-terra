# Provider Info
provider "aws" {
    region = "${var.region}"
}

# Define imported Vpc module
module "vpc" {
    #source = "../networking/vpc"
    source = "./vpc"
    name = "web"
    cidr = "10.0.0.0/16"
    public_subnet = "10.0.1.0/24"
}

/*module "terraform-registry-vpc" {
  source = "terraform-aws-modules/vpc/aws"
}
*/

# Create EC2 Resource
resource "aws_instance" "web" {
    # look up ami by mapping to region
    ami = "${lookup(var.ami, var.region)}"
    
    # Instance type to create
    instance_type = "${var.instance_type}"
    
    key_name = "${var.key_name}"
    
    subnet_id = "${module.vpc.public_subnet_id}"
    associate_public_ip_address = true
    
    # User data file
    user_data = "${file("files/web_bootstrap.sh")}"

    # Vpc Security Groups to Use
    vpc_security_group_ids = ["${aws_security_group.web_host_sg.id}",]

    # Specify Number of Resources to be Created
    count = 2
}

resource "aws_elb" "web" {
    name = "web-elb"
    subnets = ["${module.vpc.public_subnet_id}"]
    security_groups = ["${aws_security_group.web_inbound_sg.id}",]
    listener {
        instance_port = 80
        instance_protocol = "http"
        lb_port = 80
        lb_protocol = "http"
    }
    instances = ["${aws_instance.web.*.id}",]
}

resource "aws_security_group" "web_inbound_sg"{

}