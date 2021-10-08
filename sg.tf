# SF hardened rules
resource "aws_security_group" "SF_DB_Security_Group" {
  vpc_id       = module.vpc.vpc_id
  name         = "SF DB Hardened Security Group"
    tags = {
      Name = "SF DB Hardened Security Group"
  }
}

resource "aws_security_group_rule" "SF_DB_Security_Group_ingress" {
  count = length(var.sf_db_ingress_rules)

  type              = "ingress"
  from_port         = var.sf_db_ingress_rules[count.index].from_port
  to_port           = var.sf_db_ingress_rules[count.index].to_port
  protocol          = var.sf_db_ingress_rules[count.index].protocol
  cidr_blocks       = var.sf_db_ingress_rules[count.index].cidr_block
  description       = var.sf_db_ingress_rules[count.index].description
  security_group_id = aws_security_group.SF_DB_Security_Group.id
}

resource "aws_security_group_rule" "SF_DB_Security_Group_egress" {
  count = length(var.sf_common_egress_rules)

  type              = "egress"
  from_port         = var.sf_common_egress_rules[count.index].from_port
  to_port           = var.sf_common_egress_rules[count.index].to_port
  protocol          = var.sf_common_egress_rules[count.index].protocol
  cidr_blocks       = var.sf_common_egress_rules[count.index].cidr_block
  description       = var.sf_common_egress_rules[count.index].description
  security_group_id = aws_security_group.SF_DB_Security_Group.id
}
###########################################################
resource "aws_security_group" "SF_Web_Security_Group" {
  vpc_id       = module.vpc.vpc_id
  name         = "SF Web Hardened Security Group"
    tags = {
      Name = "SF Web Hardened Security Group"
  }
}

resource "aws_security_group_rule" "SF_Web_Security_Group_ingress" {
  count = length(var.sf_web_ingress_rules)

  type              = "ingress"
  from_port         = var.sf_web_ingress_rules[count.index].from_port
  to_port           = var.sf_web_ingress_rules[count.index].to_port
  protocol          = var.sf_web_ingress_rules[count.index].protocol
  cidr_blocks       = var.sf_web_ingress_rules[count.index].cidr_block
  description       = var.sf_web_ingress_rules[count.index].description
  security_group_id = aws_security_group.SF_Web_Security_Group.id
}

resource "aws_security_group_rule" "SF_Web_Security_Group_egress" {
  count = length(var.sf_common_egress_rules)

  type              = "egress"
  from_port         = var.sf_common_egress_rules[count.index].from_port
  to_port           = var.sf_common_egress_rules[count.index].to_port
  protocol          = var.sf_common_egress_rules[count.index].protocol
  cidr_blocks       = var.sf_common_egress_rules[count.index].cidr_block
  description       = var.sf_common_egress_rules[count.index].description
  security_group_id = aws_security_group.SF_Web_Security_Group.id
}
###########################################################
resource "aws_security_group" "SF_WinJump_Security_Group" {
  vpc_id       = module.vpc.vpc_id
  name         = "SF WinJump Hardened Security Group"
    tags = {
      Name = "SF WinJump Hardened Security Group"
  }
}

resource "aws_security_group_rule" "SF_WinJump_Security_Group_ingress" {
  count = length(var.sf_winjump_ingress_rules)

  type              = "ingress"
  from_port         = var.sf_winjump_ingress_rules[count.index].from_port
  to_port           = var.sf_winjump_ingress_rules[count.index].to_port
  protocol          = var.sf_winjump_ingress_rules[count.index].protocol
  cidr_blocks       = var.sf_winjump_ingress_rules[count.index].cidr_block
  description       = var.sf_winjump_ingress_rules[count.index].description
  security_group_id = aws_security_group.SF_WinJump_Security_Group.id
}

resource "aws_security_group_rule" "SF_WinJump_Security_Group_egress" {
  count = length(var.sf_common_egress_rules)

  type              = "egress"
  from_port         = var.sf_common_egress_rules[count.index].from_port
  to_port           = var.sf_common_egress_rules[count.index].to_port
  protocol          = var.sf_common_egress_rules[count.index].protocol
  cidr_blocks       = var.sf_common_egress_rules[count.index].cidr_block
  description       = var.sf_common_egress_rules[count.index].description
  security_group_id = aws_security_group.SF_WinJump_Security_Group.id
}
###########################################################
resource "aws_security_group" "SF_Redis_Security_Group" {
  vpc_id       = module.vpc.vpc_id
  name         = "SF Redis Hardened Security Group"
    tags = {
      Name = "SF Redis Hardened Security Group"
  }
}

resource "aws_security_group_rule" "SF_Redis_Security_Group_ingress" {
  count = length(var.sf_redis_ingress_rules)

  type              = "ingress"
  from_port         = var.sf_redis_ingress_rules[count.index].from_port
  to_port           = var.sf_redis_ingress_rules[count.index].to_port
  protocol          = var.sf_redis_ingress_rules[count.index].protocol
  cidr_blocks       = var.sf_redis_ingress_rules[count.index].cidr_block
  description       = var.sf_redis_ingress_rules[count.index].description
  security_group_id = aws_security_group.SF_Redis_Security_Group.id
}

resource "aws_security_group_rule" "SF_Redis_Security_Group_egress" {
  count = length(var.sf_common_egress_rules)

  type              = "egress"
  from_port         = var.sf_common_egress_rules[count.index].from_port
  to_port           = var.sf_common_egress_rules[count.index].to_port
  protocol          = var.sf_common_egress_rules[count.index].protocol
  cidr_blocks       = var.sf_common_egress_rules[count.index].cidr_block
  description       = var.sf_common_egress_rules[count.index].description
  security_group_id = aws_security_group.SF_Redis_Security_Group.id
}
###########################################################

resource "aws_security_group" "SF_SFTP_Security_Group" {
  vpc_id       = module.vpc.vpc_id
  name         = "SF SFTP Hardened Security Group"
    tags = {
      Name = "SF SFTP Hardened Security Group"
  }
}

resource "aws_security_group_rule" "SF_SFTP_Security_Group_ingress" {
  count = length(var.sf_sftp_ingress_rules)

  type              = "ingress"
  from_port         = var.sf_sftp_ingress_rules[count.index].from_port
  to_port           = var.sf_sftp_ingress_rules[count.index].to_port
  protocol          = var.sf_sftp_ingress_rules[count.index].protocol
  cidr_blocks       = var.sf_sftp_ingress_rules[count.index].cidr_block
  description       = var.sf_sftp_ingress_rules[count.index].description
  security_group_id = aws_security_group.SF_SFTP_Security_Group.id
}

resource "aws_security_group_rule" "SF_SFTP_Security_Group_egress" {
  count = length(var.sf_common_egress_rules)

  type              = "egress"
  from_port         = var.sf_common_egress_rules[count.index].from_port
  to_port           = var.sf_common_egress_rules[count.index].to_port
  protocol          = var.sf_common_egress_rules[count.index].protocol
  cidr_blocks       = var.sf_common_egress_rules[count.index].cidr_block
  description       = var.sf_common_egress_rules[count.index].description
  security_group_id = aws_security_group.SF_SFTP_Security_Group.id
}
###########################################################

resource "aws_security_group" "SF_NFS_Security_Group" {
  vpc_id       = module.vpc.vpc_id
  name         = "SF NFS Hardened Security Group"
    tags = {
      Name = "SF NFS Hardened Security Group"
  }
}

resource "aws_security_group_rule" "SF_NFS_Security_Group_ingress" {
  count = length(var.sf_nfs_ingress_rules)

  type              = "ingress"
  from_port         = var.sf_nfs_ingress_rules[count.index].from_port
  to_port           = var.sf_nfs_ingress_rules[count.index].to_port
  protocol          = var.sf_nfs_ingress_rules[count.index].protocol
  cidr_blocks       = var.sf_nfs_ingress_rules[count.index].cidr_block
  description       = var.sf_nfs_ingress_rules[count.index].description
  security_group_id = aws_security_group.SF_NFS_Security_Group.id
}

resource "aws_security_group_rule" "SF_NFS_Security_Group_egress" {
  count = length(var.sf_common_egress_rules)

  type              = "egress"
  from_port         = var.sf_common_egress_rules[count.index].from_port
  to_port           = var.sf_common_egress_rules[count.index].to_port
  protocol          = var.sf_common_egress_rules[count.index].protocol
  cidr_blocks       = var.sf_common_egress_rules[count.index].cidr_block
  description       = var.sf_common_egress_rules[count.index].description
  security_group_id = aws_security_group.SF_NFS_Security_Group.id
}

###########################################################

resource "aws_security_group" "SF_APP_Security_Group" {
  vpc_id       = module.vpc.vpc_id
  name         = "SF APP Hardened Security Group"
    tags = {
      Name = "SF APP Hardened Security Group"
  }
}

resource "aws_security_group_rule" "SF_APP_Security_Group_ingress" {
  count = length(var.sf_app_ingress_rules)

  type              = "ingress"
  from_port         = var.sf_app_ingress_rules[count.index].from_port
  to_port           = var.sf_app_ingress_rules[count.index].to_port
  protocol          = var.sf_app_ingress_rules[count.index].protocol
  cidr_blocks       = var.sf_app_ingress_rules[count.index].cidr_block
  description       = var.sf_app_ingress_rules[count.index].description
  security_group_id = aws_security_group.SF_APP_Security_Group.id
}

resource "aws_security_group_rule" "SF_APP_Security_Group_egress" {
  count = length(var.sf_common_egress_rules)

  type              = "egress"
  from_port         = var.sf_common_egress_rules[count.index].from_port
  to_port           = var.sf_common_egress_rules[count.index].to_port
  protocol          = var.sf_common_egress_rules[count.index].protocol
  cidr_blocks       = var.sf_common_egress_rules[count.index].cidr_block
  description       = var.sf_common_egress_rules[count.index].description
  security_group_id = aws_security_group.SF_APP_Security_Group.id
}
###########################################################

resource "aws_security_group" "SF_ALB_Security_Group" {
  vpc_id       = module.vpc.vpc_id
  name         = "SF ALB Hardened Security Group"
    tags = {
      Name = "SF ALB Hardened Security Group"
  }
}

resource "aws_security_group_rule" "SF_ALB_Security_Group_ingress" {
  count = length(var.sf_alb_ingress_rules)

  type              = "ingress"
  from_port         = var.sf_alb_ingress_rules[count.index].from_port
  to_port           = var.sf_alb_ingress_rules[count.index].to_port
  protocol          = var.sf_alb_ingress_rules[count.index].protocol
  cidr_blocks       = var.sf_alb_ingress_rules[count.index].cidr_block
  description       = var.sf_alb_ingress_rules[count.index].description
  security_group_id = aws_security_group.SF_ALB_Security_Group.id
}

resource "aws_security_group_rule" "SF_ALB_Security_Group_egress" {
  count = length(var.sf_common_egress_rules)

  type              = "egress"
  from_port         = var.sf_common_egress_rules[count.index].from_port
  to_port           = var.sf_common_egress_rules[count.index].to_port
  protocol          = var.sf_common_egress_rules[count.index].protocol
  cidr_blocks       = var.sf_common_egress_rules[count.index].cidr_block
  description       = var.sf_common_egress_rules[count.index].description
  security_group_id = aws_security_group.SF_ALB_Security_Group.id
}

