###############
# NAT Gateway #
###############

locals {
    max_subnet_length = "${max(length(var.private_subnets))}"
    nat_gateway_ips = "${split(",", (var.reuse_nat_ips ? join(",", var.external_nat_ip_ids) : join(",", aws_eip.nat.*.id)))}"
    nat_gateway_count = "${var.single_nat_gateway ? 1 : (var.one_nat_gateway_per_az ? length(var.azs) : local.max_subnet_length)}"
}

resource "aws_eip" "nat" {
    count = "${(var.enable_nat_gateway && !var.reuse_nat_ips) ? local.nat_gateway_count : 0}"

    vpc = true

    tags = "${merge(map("Name", format("%s-%s", var.name, element(var.azs, (var.single_nat_gateway ? 0 : count.index)))), var.tags, var.nat_eip_tags)}"
}

resource "aws_nat_gateway" "this" {
    count = "${var.enable_nat_gateway ? local.nat_gateway_count : 0}"

    allocation_id = "${element(local.nat_gateway_ips, (var.single_nat_gateway ? 0 : count.index))}"
    subnet_id     = "${element(var.public_subnets, (var.single_nat_gateway ? 0 : count.index))}"

    tags = "${merge(map("Name", format("%s-%s", var.name, element(var.azs, (var.single_nat_gateway ? 0 : count.index)))), var.tags, var.nat_gateway_tags)}"

    #depends_on = ["${var.gateway_id}"]
}

resource "aws_route" "private_nat_gateway" {
    count = "${var.enable_nat_gateway ? local.nat_gateway_count : 0}"

    route_table_id          = "${element(var.private_route_tables, count.index)}"
    destination_cidr_block  = "0.0.0.0/0"
    nat_gateway_id          = "${element(aws_nat_gateway.this.*.id, count.index)}"


    timeouts {
        create = "5m"
    }
}