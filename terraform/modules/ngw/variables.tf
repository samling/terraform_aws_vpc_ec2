variable "name" {
    description     = "Name to be used on all resources as an identifier"
    default         = ""
}

variable "azs" {
  description = "A list of availability zones in the region"
  default     = []
}

variable "gateway_id" {
  description = "ID of the internet gateway"
  default     = ""
}

variable "enable_nat_gateway" {
  description = "Should be true if you want to provision NAT Gateways for each of your private networks"
  default     = false
}

variable "external_nat_ip_ids" {
  description = "List of EIP IDs to be assigned to the NAT Gateways (used in combination with reuse_nat_ips)"
  type        = "list"
  default     = []
}

variable "one_nat_gateway_per_az" {
  description = "Should be true if you want only one NAT Gateway per availability zone. Requires `var.azs` to be set, and the number of `public_subnets` created to be greater than or equal to the number of availability zones specified in `var.azs`."
  default     = false
}

variable "public_subnets" {
    description = "List of public subnets"
    default     = []
}

variable "private_subnets" {
    description = "List of private subnets"
    default     = []
}

variable "private_route_tables" {
    description = "List of route tables attached to private subnets"
    default     = []
}

variable "nat_gateway_tags" {
  description = "Additional tags for the NAT gateways"
  default     = {}
}

variable "nat_eip_tags" {
  description = "Additional tags for the NAT EIP"
  default     = {}
}

variable "reuse_nat_ips" {
  description = "Should be true if you don't want EIPs to be created for your NAT Gateways and will instead pass them in via the 'external_nat_ip_ids' variable"
  default     = false
}

variable "single_nat_gateway" {
  description = "Should be true if you want to provision a single shared NAT Gateway across all of your private networks"
  default     = false
}

variable "vpc_id" {
    description     = "ID of the parent VPC"
    default         = ""
}

variable "tags" {
    description     = "A map of tags to add to all resources"
    default         = {}
}