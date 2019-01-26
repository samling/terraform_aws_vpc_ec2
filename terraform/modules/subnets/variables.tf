variable "name" {
    description     = "Name to be used on all resources as an identifier"
    default         = ""
}

variable "create_vpc" {
    description     = "controls if a vpc should be created"
    default         = true
}

variable "vpc_id" {
    description     = "ID of the parent VPC"
    default         = ""
}

variable "azs" {
  description = "A list of availability zones in the region"
  default     = []
}

variable "map_public_ip_on_launch" {
  description = "Should be false if you do not want to auto-assign public IP on launch"
  default     = true
}

variable "public_subnets" {
    description     = "A list of public subnets inside the VPC"
    default         = []
}

variable "private_subnets" {
    description     = "A list of private subnets inside the VPC"
    default         = []
}

variable "public_subnet_suffix" {
  description = "Suffix to append to public subnets name"
  default     = "public"
}

variable "private_subnet_suffix" {
  description = "Suffix to append to private subnets name"
  default     = "private"
}

variable "public_subnet_tags" {
  description = "Additional tags for the public subnets"
  default     = {}
}

variable "private_subnet_tags" {
  description = "Additional tags for the private subnets"
  default     = {}
}

variable "tags" {
    description     = "A map of tags to add to all resources"
    default         = {}
}