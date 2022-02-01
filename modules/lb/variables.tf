variable "vpc_cidr" {
  type        = string
  description = "set in here the CIDR for your VPC"
}
variable "vpc_id1" {
    default = ""
}

variable "subnet1_id" {
  type        = string
  description = "set in here the CIDR for your Subnet"
}

variable "subnet2_id" {
  type        = string
  description = "set in here the CIDR for your Subnet"
}


variable "env" {
  type        = string
  description = "set the env name here"
}
