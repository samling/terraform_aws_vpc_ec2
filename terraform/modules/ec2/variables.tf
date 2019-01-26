variable "name" {
    description     = "Name to be used on all resources as an identifier"
    default         = ""
}
variable "vpc_id" {
    description     = "ID of the parent VPC"
    default         = ""
}

variable "public_instance_count" {
    description     = "The number of public instances to create"
    default         = 0
}

variable "private_instance_count" {
    description     = "The number of private instances to create"
    default         = 0
}

variable "public_subnets" {
    description     = "A list of public subnets inside the VPC"
    default         = []
}

variable "private_subnets" {
    description     = "A list of private subnets inside the VPC"
    default         = []
}

variable "instance_name" {
    description     = "The name of EC2 instance"
    default         = ""
}

variable "instance_type" {
    description     = "The type of EC2 instance, e.g. t2.large"
    default         = "t2.micro"
}

variable "ami" {
    description     = "The AMI ID for the EC2 instance"
    default         = ""
}

variable "associate_public_ip_address" {
    description     = "Whether to associate a public IP with the instance"
    default         = true
}

variable "instance_iam_profile" {
    description     = "An IAM profile to associate with the instance"
    default         = ""
}

variable "key_name" {
    description     = "The name of the keypair to associate with the instance"
    default         = ""
}

variable "instance_root_volume_type" {
    description     = "The type of root volume"
    default         = "gp2"
}

variable "instance_root_volume_size" {
    description     = "The size of root volume"
    default         = "20"
}

variable "instance_root_volume_delete_on_termination" {
    description     = "Whether to delete the block device when the instance is deleted"
    default         = true
}

variable "ec2_tags" {
    description     = "A map of tags to add to the instance"
    default         = {}
}

variable "tags" {
    description     = "A map of tags to add to all resources"
    default         = {}
}