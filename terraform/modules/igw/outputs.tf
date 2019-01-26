output "igw_id" {
    value = "${element(concat(aws_internet_gateway.this.*.id, list("")), 0)}"
}