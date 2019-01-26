provider "aws" {
    shared_credentials_file = "${var.cred_file}"
    region                  = "${var.region}"
    profile                 = "${var.profile}"
}

module "vpc" {
    source = "./modules/vpc"

    name                    = "${var.project_name}"
    cidr                    = "${var.vpc_cidr}"
}
module "igw" {
    source = "./modules/igw"

    name                    = "${module.vpc.name}"
    private_subnets         = "${module.subnets.private_subnets_cidr_blocks}"
    public_subnets          = "${module.subnets.public_subnets_cidr_blocks}"
    vpc_id                  = "${module.vpc.vpc_id}"
}
module "subnets" {
    source = "./modules/subnets"

    name                    = "${module.vpc.name}"

    azs                     = ["${var.azs}"]
    public_subnets          = ["${var.public_subnets}"]
    private_subnets         = ["${var.private_subnets}"]
    vpc_id                  = "${module.vpc.vpc_id}"
    map_public_ip_on_launch = true
}

module "routing" {
    source = "./modules/routing"

    name                    = "${module.vpc.name}"
    azs                     = "${module.subnets.azs}"
    gateway_id              = "${module.igw.igw_id}"
    private_subnets         = "${module.subnets.private_subnets}"
    public_subnets          = "${module.subnets.public_subnets}"
    private_subnets_cidr    = "${module.subnets.private_subnets_cidr_blocks}"
    public_subnets_cidr     = "${module.subnets.public_subnets_cidr_blocks}"
    vpc_id                  = "${module.vpc.vpc_id}"
}

module "ngw" {
    source = "./modules/ngw"

    name                    = "${module.vpc.name}"
    azs                     = "${module.subnets.azs}"
    enable_nat_gateway      = "${module.routing.enable_nat_gateway}"
    gateway_id              = "${module.igw.igw_id}"
    private_route_tables    = "${module.routing.private_route_tables}"
    public_subnets          = "${module.subnets.public_subnets}"
    private_subnets         = "${module.subnets.private_subnets_cidr_blocks}"
    vpc_id                  = "${module.vpc.vpc_id}"
    single_nat_gateway      = false
}