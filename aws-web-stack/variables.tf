# Terraform Variables
variable "region" {
  description = "AWS Region"
  default = "us-east-2"
}

variable "region_list" {
    type = "list"
    description = "Regions managed"
    default = ["us-east-1", "us-east-2"]
}
variable "key_name" {
  description = "AWS Key Pair for Rescources"
  default = "~/.ssh/terraform"
}

variable "ami"{
    type = "map"
    default = {
        us-east-1 = "ami-00c03f7f7f2ec15c3"
        us-east-2 = "ami-04763b3055de4860b"
    }
    description = "Ami's to use."
}

variable "instance_type" {
  description = "The instance type"
  default     = "t2.micro"
}

variable "instance_ips" {
  description = "Ips for Instances"
  default     = ["10.0.1.20", "10.0.1.21"]
}

variable "owner_tag" {
  default = ["somhm-team-1", "somhm-team-2"]
}

variable "enviroment" {
  default = "development"
}

