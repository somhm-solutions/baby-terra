# Provider Info
provider "aws"{
    shared_credentials_file = "~/.aws/credentials"
    region     = "${var.region}"
}

# Define imported Vpc module
module "vpc" {
  #source        = "${var.git_repo}?ref=v0.0.1"
  #source = "../networking/vpc"
  source        = "./vpc"
  name          = "web"
  cidr          = "10.0.0.0/16"
  public_subnet = "10.0.1.0/24"
}

# Registry load of module example
/*module "terraform-registry-vpc" {
  source = "terraform-aws-modules/vpc/aws"
}
*/
# Create local variable
/*
locals {
  ami_list = "${lookup(var.ami, var.region)}"
}*/

# Create EC2 Resources
resource "aws_instance" "web" {
  # look up ami by mapping to region
  ami = "${lookup(var.ami, var.region)}"

  # Instance type to create
  instance_type = "${var.instance_type}"

  key_name = "${var.key_name}"

  subnet_id  = "${module.vpc.public_subnet_id}"
  private_ip = "${var.instance_ips[count.index]}"

  associate_public_ip_address = true


  # User data: Use file() to load data as attribute
  user_data = "${file("../files/web-bootstrap.sh")}"

  # Vpc Security Groups to Use
  vpc_security_group_ids = ["${aws_security_group.web_host_sg.id}", ]

  # Tags to place on Instances
  tags = {
    # Use format() to format with go  fmt backend
    Name = "web-${format("%03d", count.index + 1)}"
    # Use element to wrap elements in list in loop
    Owner = "${element(var.owner_tag, count.index)}"
  }

  # Specify Number of Resources to be Created
  # Use count over length to loop through resources 
  count = "${length(var.instance_ips)}"
  # Alternatively, use terenary to push to use conditionals in build pipeline
  #count = "${var.enviroment == "production" ? 4 : 2}"
}

# Create Elastic Load Balancer Resource
resource "aws_elb" "web" {
  name            = "web-elb"
  subnets         = ["${module.vpc.public_subnet_id}"]
  security_groups = ["${aws_security_group.web_inbound_sg.id}", ]
  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }
  # Instance registered automatatically
  instances = ["${aws_instance.web.*.id}", ]
}

# Create AWS Security Group Resource
resource "aws_security_group" "web_inbound_sg" {
  name        = "web_inbound"
  description = "Allow HTTP from Anywhere"
  vpc_id      = "${module.vpc.vpc_id}"

  # Allow Http 
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow Ping
  ingress {
    from_port   = 8
    to_port     = 0
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "web_host_sg" {
  name        = "web_host"
  description = "Allow ssh & http to hosts"
  vpc_id      = "${module.vpc.vpc_id}"

  # Allow SSH
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow Http from VPC ONLY
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["${module.vpc.cidr}", ]
  }

  # Inbound Ping
  ingress {
    from_port   = 8
    to_port     = 0
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Outbound All 
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

