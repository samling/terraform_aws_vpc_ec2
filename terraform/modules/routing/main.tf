###########
# Routing #
###########

locals {
    max_subnet_length = "${max(length(var.private_subnets_cidr))}"

    nat_gateway_count = "${var.single_nat_gateway ? 1 : (var.one_nat_gateway_per_az ? length(var.azs) : local.max_subnet_length)}"
}

resource "aws_route_table" "public" {
    #count = "${var.create_vpc && length(var.public_subnets) > 0 ? 1 : 0}"
    count = "${length(var.public_subnets_cidr) > 0 ? 1 : 0}"

    vpc_id = "${var.vpc_id}"

    tags = "${merge(map("Name", (var.single_nat_gateway ? "${var.name}-${var.private_subnet_suffix}" : format("%s-${var.private_subnet_suffix}-%s", var.name, element(var.azs, count.index)))), var.tags, var.private_route_table_tags)}"
}

resource "aws_route" "public_internet_gateway" {
    #count = "${var.create_vpc && length(var.public_subnets) > 0 ? 1 : 0}"
    count = "${length(var.public_subnets_cidr) > 0 ? 1 : 0}"

    route_table_id          = "${aws_route_table.public.id}"
    destination_cidr_block  = "0.0.0.0/0"
    gateway_id              = "${var.gateway_id}"

    timeouts {
        create = "5m"
    }
}

resource "aws_route_table" "private" {
    #count = "${var.create_vpc && local.max_subnet_length > 0 ? local.nat_gateway_count : 0}"
    count = "${local.max_subnet_length > 0 ? local.nat_gateway_count : 0}"

    vpc_id = "${var.vpc_id}"

    tags = "${merge(map("Name", (var.single_nat_gateway ? "${var.name}-${var.private_subnet_suffix}" : format("%s-${var.private_subnet_suffix}-%s", var.name, element(var.azs, count.index)))), var.tags, var.private_route_table_tags)}"

    lifecycle {
        ignore_changes = ["propagating_vgws"]
    }
}

resource "aws_route_table_association" "public" {
    count = "${length(var.public_subnets_cidr) > 0 ? length(var.public_subnets_cidr) : 0}"

    subnet_id       = "${element(var.public_subnets, count.index)}"
    route_table_id  = "${aws_route_table.public.id}"
}

resource "aws_route_table_association" "private" {
    count = "${length(var.private_subnets_cidr) > 0 ? length(var.private_subnets) : 0}"

    subnet_id       = "${element(var.private_subnets, count.index)}"
    route_table_id  = "${element(aws_route_table.private.*.id, (var.single_nat_gateway ? 0 : count.index))}"
}