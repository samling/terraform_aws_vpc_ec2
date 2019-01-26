module "ec2_instance" {
    ### DO NOT MODIFY ###
    source = "./modules/ec2"

    name                    = "${module.vpc.name}"
    public_subnets          = "${module.subnets.public_subnets}"
    private_subnets         = "${module.subnets.private_subnets}"
    vpc_id                  = "${module.vpc.vpc_id}"

    ### MODIFY BELOW THIS LINE ###
    ami                         = ""
    instance_type               = "t2.micro"
    instance_root_volume_size   = 20
    public_instance_count       = 1
    private_instance_count      = 0
    key_name                    = ""
}
