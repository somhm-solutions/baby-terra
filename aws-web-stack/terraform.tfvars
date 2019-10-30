# Terraform Variables

variable "region" {
    description = "AWS Region"
}

variable "key_name" {
    description = "AWS Key Pair for Rescources"
    #default = "~/.ssh/terraform"
    sensitive = true
}

variable "ami" {
    type = "map"
    description = "Amis to use"
    default = {}
}

variable "instance_type" {
    description = "The instance type"
    default = "t2.micro"
}

variable "instance_ips" {
    description = "Ips for Instances"
    default = ["10.0.1.20", "10.0.1.21"]
}

variable "owner_tag" {
    default = ["somhm-team-1", "somhm-team-2"]
}

variable "enviroment" {
    default = "development"
}

