#######
# VPC #
#######
resource "aws_vpc" "this" {
    cidr_block                          = "${var.cidr}"
    instance_tenancy                    = "${var.instance_tenancy}"
    enable_dns_hostnames                = "${var.enable_dns_hostnames}"
    enable_dns_support                  = "${var.enable_dns_support}"
    assign_generated_ipv6_cidr_block    = "${var.assign_generated_ipv6_cidr_block}"

    tags ="${merge(map("Name", format("%s", var.name)), var.tags, var.vpc_tags)}"
}
