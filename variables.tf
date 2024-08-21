variable "cidr_block" {
  type = string
}

variable "vpc_name" {
  type    = string
  default = "my-vpc"

}

## Public Subnet Vars
variable "publicsnet_cidr" {
  type = list(string)

}
variable "publicsnet_prefix" {
  type    = string
  default = "public_subnet"

}
