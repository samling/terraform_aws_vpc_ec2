variable "create_vpc" {
    description     = "Controls if a VPC should be created"
    default         = true
}

variable "name" {
    description     = "Name to be used on all resources as an identifier"
    default         = ""
}

variable "cidr" {
    description     = "CIDR block for the VPC"
    default         = "10.0.0.0/16"
}

variable "assign_generated_ipv6_cidr_block" {
    description     = "Requests an Amazon-provided IPv6 /56 CIDR block"
    default         = false
}

variable "instance_tenancy" {
    description     = "Tenancy option for instances launched into VPC"
    default         = "default"
}

variable "enable_dns_hostnames" {
  description = "Should be true to enable DNS hostnames in the VPC"
  default     = false
}

variable "enable_dns_support" {
  description = "Should be true to enable DNS support in the VPC"
  default     = true
}

variable "tags" {
  description = "A map of tags to add to all resources"
  default     = {}
}

variable "vpc_tags" {
  description = "Additional tags for the VPC"
  default     = {}
}