# Base Variables

variable "access_key" {
    description = "AWS Access Key"
}

variable "secret_key" {
    description = "AWS secret key"
}

variable "region" {
    description = "The AWS region"
    default = "us-east-2"
}

variable "region_list" {
    type = "list"
    description = "The AWS regions managed by Terraform deploys"
    default = ["us-east-1", "us-east-2"]
}

variable "ami"{
    type = "map"
    default = {
        us-east-1 = "ami-00c03f7f7f2ec15c3"
        us-east-2 = "ami-04763b3055de4860b"
    }
    description = "Ami's to use."
}

variable "security_group_ids" {
    type = "list"
    description = ["
sg-76bfc525"]
}