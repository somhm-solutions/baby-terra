# AWS VPC Terraform Module

Lightweight VPC Terraform Module
## Usage 
module "vpc" {
    source = ""
    name = ""
    cidr = "10.0.0.0/16"
    public_subnet = "10.0.1.0/24"
}

See 'interface.tf' for additional configurable variables