variable "azs" {
    description = "List of availability zones"
    default     = []
}

variable "cred_file" {
    description = "Path to the AWS credential file"
    default     = ""
}

variable "project_name" {
    description = "Unique project identifer"
    default     = ""
}

variable "profile" {
    description = "Primary AWS credential file profile"
    default     = ""
}

variable "region" {
    description = "Primary deployment region"
    default     = ""
}

variable "vpc_cidr" {
    description = "CIDR block for the primary VPC"
    default     = ""
}

variable "public_subnets" {
    description = "List of public subnets"
    default     = []
}

variable "private_subnets" {
    description = "List of private subnets"
    default     = []
}

variable "ami_id" {
    description = "The AMI ID to be used by the instance"
    default     = ""
}

variable "instance_type" {
    description = "The type of EC2 instance, e.g. t2.large"
    default     = ""
}

variable "public_instance_count" {
    description = "The number of public instances to create"
    default     = 0
}

variable "private_instance_count" {
    description = "The number of private instances to create"
    default     = 0
}

variable "key_name" {
    description = "The name of the existing keypair to attach to the instance"
    default     = ""
}