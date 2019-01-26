### Setup

To use, create a tfvars file in the `data/` directory with the following contents (with example values):

```
###################
# Project Details #
###################
project_name            = "my-project"
cred_file               = "./creds"
profile                 = "default" # This must correspond to the tag in the creds file; see below

###################
#   VPC Details   #
###################
region                  = "us-west-1"
azs                     = [ "us-west-1b", "us-west-1c" ]
vpc_cidr                = "10.0.0.0/16"

###################
# Network Details #
###################
public_subnets          = [ "10.0.1.0/24", "10.0.2.0/24" ] # Make sure the number of public subnets is equal to or greater than the number of AZs!
private_subnets         = [ "10.0.3.0/24", "10.0.4.0/24" ]
```

Then, create a file in the root directory called `ec2.tf` with an instance of the EC2 module for each set of servers:

```
module "WinServer2012R2" {
    ### DO NOT MODIFY ###
    source = "./modules/ec2"

    name                    = "${module.vpc.name}"
    public_subnets          = "${module.subnets.public_subnets}"
    private_subnets         = "${module.subnets.private_subnets}"
    vpc_id                  = "${module.vpc.vpc_id}"

    ### MODIFY BELOW THIS LINE ###
    ami                         = "ami-0b438216336682d57"
    instance_type               = "t2.micro"
    instance_root_volume_size   = 30
    public_instance_count       = 2
    private_instance_count      = 0
    key_name                    = "my_keypair"
}
```

You can create multiple servers of a single type by setting `public_instance_count` and/or `private_instance_count` to a value other than 0.

Lastly, create a `creds` file in the top level directory with the following contents (with example values):

```
[default] # This is your 'profile' value in your tfvars file
aws_access_key_id = YOUR_ACCESS_KEY
aws_secret_access_key = YOUR_ACCESS_SECRET
```

Finally, run `terraform init` and `terraform apply -var-file=data/dev.tfvars` 
