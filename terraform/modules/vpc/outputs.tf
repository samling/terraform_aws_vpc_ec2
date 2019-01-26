output "vpc_id" {
    description = "The ID of the VPC"
    value       = "${element(concat(aws_vpc.this.*.id, list("")), 0)}"
}

output "name" {
    description = "A global unique identifier for all resources"
    value       = "${var.name}"
}