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

variable "route_table_id" {
  description = "ID of the public route table"
  default     = ""
}

variable "gateway_id" {
  description = "ID of the internet gateway"
  default     = ""
}

variable "azs" {
  description = "A list of availability zones in the region"
  default     = []
}

variable "one_nat_gateway_per_az" {
  description = "Should be true if you want only one NAT Gateway per availability zone. Requires `var.azs` to be set, and the number of `public_subnets` created to be greater than or equal to the number of availability zones specified in `var.azs`."
  default     = false
}

variable "public_subnets" {
    description     = "A list of public subnet IDs inside the VPC"
    default         = []
}

variable "private_subnets" {
    description     = "A list of private subnet IDs inside the VPC"
    default         = []
}

variable "public_subnets_cidr" {
    description     = "A list of public subnet CIDR blocks inside the VPC"
    default         = []
}

variable "private_subnets_cidr" {
    description     = "A list of private subnet CIDR blocks inside the VPC"
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

variable "single_nat_gateway" {
  description = "Should be true if you want to provision a single shared NAT Gateway across all of your private networks"
  default     = false
}

variable "private_route_table_tags" {
  description = "Additional tags for the private route tables"
  default     = {}
}

variable "tags" {
    description     = "A map of tags to add to all resources"
    default         = {}
}