#######
# EC2 #
#######

resource "aws_instance" "public" {
    count                           = "${var.public_instance_count}"
    
    instance_type                   = "${var.instance_type}"
    ami                             = "${var.ami}"
    associate_public_ip_address     = "${var.associate_public_ip_address}"
    iam_instance_profile            = "${var.instance_iam_profile}"
    key_name                        = "${var.key_name}"
    subnet_id                       = "${element(var.public_subnets, count.index)}"
    vpc_security_group_ids          = ["${aws_security_group.this.id}"]

    root_block_device = {
        volume_type                 = "${var.instance_root_volume_type}"
        volume_size                 = "${var.instance_root_volume_size}"
        delete_on_termination       = "${var.instance_root_volume_delete_on_termination}"
    }

    tags ="${merge(map("Name", format("%s", var.instance_name)), var.tags, var.ec2_tags)}"
}

resource "aws_instance" "private" {
    count                           = "${var.private_instance_count}"

    instance_type                   = "${var.instance_type}"
    ami                             = "${var.ami}"
    associate_public_ip_address     = "${var.associate_public_ip_address}"
    iam_instance_profile            = "${var.instance_iam_profile}"
    key_name                        = "${var.key_name}"
    subnet_id                       = "${element(var.private_subnets, count.index)}"
    vpc_security_group_ids          = ["${aws_security_group.this.id}"]

    root_block_device = {
        volume_type                 = "${var.instance_root_volume_type}"
        volume_size                 = "${var.instance_root_volume_size}"
        delete_on_termination       = "${var.instance_root_volume_delete_on_termination}"
    }

    tags ="${merge(map("Name", format("%s", var.instance_name)), var.tags, var.ec2_tags)}"
}

##############
# Default SG #
##############

resource "aws_security_group" "this" {
    description = "Security group for EC2 instance"
    vpc_id = "${var.vpc_id}"
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags ="${merge(map("Name", format("%s-SG", var.name)), var.tags, var.ec2_tags)}"
}