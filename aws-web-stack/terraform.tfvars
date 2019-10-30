# Terraform Variables

variable "access_key"{
    description = "AWS Access"
}

variable "secret_key" {
    description = "AWS Secret"
}

variable "region" {
    description = "AWS Region"
}

variable "key_name" {
    description = "AWS Key Pair for Rescources"
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

