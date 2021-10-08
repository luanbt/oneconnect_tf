# data "aws_availability_zones" "available" {
#   state = "available"
# }
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.0.0"

  name                             = "ge-prod-vpc"
  cidr                             = var.vpc_cidr_block
  azs                              = ["ap-southeast-1a", "ap-southeast-1b"]#var.availabilityZone
  #azs				                       = data.aws_availability_zones.available.names
  public_subnets                   = [
     "10.71.10.0/25",
     "10.71.11.0/25"
    ]
  #public_subnets                   = ["10.71.10.0/24","10.71.111.0/24"]#["10.71.0.0/24"] #
  private_subnets                  = [
     "10.71.1.0/25", # for sit1 sf1
     "10.71.2.0/25" # for sit1 sf2
 #   "10.0.2.0/24", "10.0.3.0/24", 
 #   "10.0.7.0/24", "10.0.8.0/24"  
    ] 
  #database_subnets                 = ["10.71.5.0/25"] # database subnet, same as private subnet only has rds specific functionality
  database_subnets                 = [
    "10.71.5.0/25",
    "10.71.6.0/25"
  ]
  enable_nat_gateway               = true
  single_nat_gateway               = false
  one_nat_gateway_per_az           = true
  enable_dns_hostnames             = true
  enable_dns_support               = true
  default_vpc_enable_dns_hostnames = true
  default_vpc_enable_dns_support   = true
}
# Create the Hardened Security Group
resource "aws_network_acl" "GE_VPC_Hardened_Security_ACL" {
  vpc_id = module.vpc.vpc_id
  # subnet_ids = flatten([module.vpc.public_subnets,module.vpc.private_subnets])
  subnet_ids = flatten([module.vpc.public_subnets])
  tags = {
      Name = "GE_VPC Hardened ACL"
  }
}

resource "aws_network_acl_rule" "GE_VPC_Hardened_Security_ACL_ingress" {
  count = length(var.nacl_hardened_rules)

  network_acl_id = aws_network_acl.GE_VPC_Hardened_Security_ACL.id
  rule_number    = var.nacl_hardened_rules[count.index].rule_number
  egress         = var.nacl_hardened_rules[count.index].egress
  protocol       = var.nacl_hardened_rules[count.index].protocol
  rule_action    = var.nacl_hardened_rules[count.index].rule_action
  cidr_block     = var.nacl_hardened_rules[count.index].cidr_block
  from_port      = var.nacl_hardened_rules[count.index].from_port
  to_port        = var.nacl_hardened_rules[count.index].to_port
  icmp_type      = var.nacl_hardened_rules[count.index].icmp_type
  icmp_code      = var.nacl_hardened_rules[count.index].icmp_code
}

# resource "aws_security_group" "DMZ_Security_Group" {
#   name   = "DMZ Security Group"
#   # put the description
#   vpc_id = module.vpc.vpc_id
#     tags = {
#       Name = "DMZ Security Group"
#   }
# }

# resource "aws_security_group_rule" "DMZ_Security_Group_ingress" {
#   count = length(var.dmz_ingress_rules)

#   type              = "ingress"
#   from_port         = var.dmz_ingress_rules[count.index].from_port
#   to_port           = var.dmz_ingress_rules[count.index].to_port
#   protocol          = var.dmz_ingress_rules[count.index].protocol
#   cidr_blocks       = var.dmz_ingress_rules[count.index].cidr_block
#   description       = var.dmz_ingress_rules[count.index].description
#   security_group_id = aws_security_group.DMZ_Security_Group.id
# }

# resource "aws_security_group_rule" "DMZ_Security_Group_egress" {
#   count = length(var.dmz_egress_rules)

#   type              = "egress"
#   from_port         = var.dmz_egress_rules[count.index].from_port
#   to_port           = var.dmz_egress_rules[count.index].to_port
#   protocol          = var.dmz_egress_rules[count.index].protocol
#   cidr_blocks       = var.dmz_egress_rules[count.index].cidr_block
#   description       = var.dmz_egress_rules[count.index].description
#   security_group_id = aws_security_group.DMZ_Security_Group.id
# }


# SF Hardened security group

resource "aws_security_group" "SF_Hardened_Security_Group" {
  vpc_id       = module.vpc.vpc_id
  name         = "SF Hardened Security Group"
    tags = {
      Name = "SF Hardened Security Group"
  }
}

resource "aws_security_group_rule" "SF_Hardened_Security_Group_ingress" {
  count = length(var.sf_hardened_ingress_rules)

  type              = "ingress"
  from_port         = var.sf_hardened_ingress_rules[count.index].from_port
  to_port           = var.sf_hardened_ingress_rules[count.index].to_port
  protocol          = var.sf_hardened_ingress_rules[count.index].protocol
  cidr_blocks       = var.sf_hardened_ingress_rules[count.index].cidr_block
  description       = var.sf_hardened_ingress_rules[count.index].description
  security_group_id = aws_security_group.SF_Hardened_Security_Group.id
}

resource "aws_security_group_rule" "SF_Hardened_Security_Group_egress" {
  count = length(var.sf_hardened_egress_rules)

  type              = "egress"
  from_port         = var.sf_hardened_egress_rules[count.index].from_port
  to_port           = var.sf_hardened_egress_rules[count.index].to_port
  protocol          = var.sf_hardened_egress_rules[count.index].protocol
  cidr_blocks       = var.sf_hardened_egress_rules[count.index].cidr_block
  description       = var.sf_hardened_egress_rules[count.index].description
  security_group_id = aws_security_group.SF_Hardened_Security_Group.id
}
