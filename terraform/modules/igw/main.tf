#######
# IGW #
#######

resource "aws_internet_gateway" "this" {
    #count = "${var.create_vpc && length(var.public_subnets) > 0 ? 1 : 0}"
    count = "${length(var.public_subnets) > 0 ? 1 : 0}"

    vpc_id = "${var.vpc_id}"

    tags = "${merge(map("Name", format("%s", var.name)), var.tags, var.igw_tags)}"
}