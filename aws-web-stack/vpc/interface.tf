# Vpc interface variables
variable "name" {
    description = "Name of VPC"
}

variable "cidr" {
    description = "Cidr of VPC"
}

variable "public_subnet" {
    description = "Public subnet to create"
}

variable "enable_dns_hostnames" {
    description = "True = use private dns within vpc"
    default = true
}

variable "enable_dns_support" {
    description = "True for private dns in vpc"
    default = true
}

output "public_subnet_id" {
    value = "${aws_vpc.tfb.id}"
    sensetive = true
}

output "vpc_id" {
    value = "${aws_vpc.tfb.id}"
}

output "cidr" {
    value = "${aws_vpc.tfb.cidr_block}"
}