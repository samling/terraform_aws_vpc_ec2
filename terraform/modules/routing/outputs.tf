output "enable_nat_gateway" {
  value = "${length(var.private_subnets) > 0 ? true : false}"
}

output "private_route_tables" {
  value = ["${aws_route_table.private.*.id}"]
}