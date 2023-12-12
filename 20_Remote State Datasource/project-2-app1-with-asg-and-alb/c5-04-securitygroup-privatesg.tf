# AWS EC2 Security Group Terraform Module
# Security Group for Private EC2 Instances
module "private_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.0"

  name                = "private-sg"
  description         = "Security group with HTTP & SSH ports open for everybody (IPv4 CIDR), egress ports are all world open"
  vpc_id              =  data.terraform_remote_state.vpc.outputs.vpc_id 
  ingress_rules       = ["ssh-tcp", "http-80-tcp", "http-8080-tcp"]
  ingress_cidr_blocks = ["10.0.0.0/16"]
  egress_rules        = ["all-all"]
  tags                = local.common_tags
}