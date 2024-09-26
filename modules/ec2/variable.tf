variable "maintainer" {
  type    = string
  default = "Narcisse"
}

variable "instance_type" {
  type    = string
  default = "t2.small"
}

variable "ssh_key" {
  type    = string
  default = "devops_ubuntu"
}

variable "sg_name" {
  type    = string
  default = "NULL"
}

variable "server_name" {
  type    = string
  default = "NULL"
}

variable "public_ip" {
  type    = string
  default = "NULL"
}

variable "projet_name" {
  type    = string
  default = "ic-webapp"
}

variable "AZ" {
  type    = string
  default = "us-east-1b"
}

variable "user" {
  type    = string
  default = "ec2-user"
}