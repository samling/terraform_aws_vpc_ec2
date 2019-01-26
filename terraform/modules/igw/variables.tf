variable "create_vpc" {
    description     = "controls if a vpc should be created"
    default         = true
}

variable "name" {
    description     = "Name to be used on all resources as an identifier"
    default         = ""
}
variable "vpc_id" {
    description     = "ID of the parent VPC"
    default         = ""
}

variable "public_subnets" {
    description     = "A list of public subnets inside the VPC"
    default         = []
}

variable "private_subnets" {
    description     = "A list of private subnets inside the VPC"
    default         = []
}

variable "igw_tags" {
    description     = "A map of tags to add to the internet gateway"
    default         = {}
}

variable "tags" {
    description     = "A map of tags to add to all resources"
    default         = {}
}