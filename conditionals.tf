# Networking Conditional
module "vpc" {
    # Use conditional to choose cidr
    cidr = "${var.region} != "us-east-1" ? "172.16.0./12" : "172.18.0.0/12"}"
}