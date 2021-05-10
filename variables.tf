variable "cidr" {
  description = "CIDR for the whole VPC"
  default = "10.0.0/16"
}

variable "pubic_subnet" {
  description = "cidr block for the public subnet"
  default = "10.0.0.0/24"
}

variable "public_subnet_failover" {
  description = "cidr block in case the public subnet fails"
  default = "10.0.3.0/24"
}

variable "private_subnet" {
  description = "cidr block for the private subnet"
  default = "10.0.2.0/24"
}