###########################################################

variable "sf_db_ingress_rules" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_block  = list(string)
    description = string
  }))
  default = [
    {
      from_port = 3306
      to_port   = 3306
      protocol  = "tcp"
      cidr_block = [
          "10.71.1.8/32",
          "10.71.1.66/32",
          "10.71.1.10/32",
          "10.71.2.10/32",
          "10.71.1.11/32",
          "10.71.2.11/32",
          "10.71.1.14/32",
          "172.24.0.0/25"
      ]
      description = "SSH from permitted IP I"
    },
    {
      from_port = 22
      to_port   = 22
      protocol  = "tcp"
      cidr_block = [
          "10.71.1.8/32",
          "10.71.1.66/32",
      ]
      description = "Whitelist for SSH JUMPHOST"
    }
  ]
}

variable "sf_web_ingress_rules" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_block  = list(string)
    description = string
  }))
  default = [
    {
      from_port = 80
      to_port   = 80
      protocol  = "tcp"
      cidr_block = [
          "10.71.1.8/32",
          "10.71.1.66/32",
          "10.71.1.10/32",
          "10.71.2.10/32",
          "10.71.1.11/32",
          "10.71.2.11/32",
          "10.71.1.14/32",
          "172.24.0.0/25"
      ]
      description = "Whitelist WEB for permitted IP I"
    },
    {
      from_port = 80
      to_port   = 80
      protocol  = "tcp"
      cidr_block = [
          "10.71.10.0/25", #public subnet for AWS ALB
          "10.71.11.0/25"  #public subnet for AWS ALB
      ]
      description = "Public subnet for AWS ALB"
    },
    {
      from_port = 22
      to_port   = 22
      protocol  = "tcp"
      cidr_block = [
          "10.71.1.8/32",
          "10.71.1.66/32",
      ]
      description = "Whitelist for SSH JUMPHOST"
    },
    {
      from_port = 22
      to_port   = 22
      protocol  = "tcp"
      cidr_block = [
          "172.24.0.0/25"
      ]
      description = "Whitelist for SSH from DM2"
    }
  ]
}

variable "sf_sftp_ingress_rules" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_block  = list(string)
    description = string
  }))
  default = [
    {
      from_port = 22
      to_port   = 22
      protocol  = "tcp"
      cidr_block = [
          "10.71.1.8/32",
          "10.71.1.66/32",
          "172.24.0.0/25"
      ]
      description = "Whitelist for SSH JUMPHOST and SFTP"
    }
  ]
}

variable "sf_redis_ingress_rules" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_block  = list(string)
    description = string
  }))
  default = [
    {
      from_port = 6379
      to_port   = 6379
      protocol  = "tcp"
      cidr_block = [
          "10.71.1.8/32",
          "10.71.1.66/32",
          "10.71.1.10/32",
          "10.71.2.10/32",
          "10.71.1.11/32",
          "10.71.2.11/32",
          "10.71.1.14/32",
          "172.24.0.0/25"
      ]
      description = "Whitelist Redis for permitted IP I"
    },
    {
      from_port = 26379
      to_port   = 26379
      protocol  = "tcp"
      cidr_block = [
          "10.71.1.8/32",
          "10.71.1.66/32",
          "10.71.1.10/32",
          "10.71.2.10/32",
          "10.71.1.11/32",
          "10.71.2.11/32",
          "10.71.1.14/32",
          "172.24.0.0/25"
      ]
      description = "Whitelist Redis for permitted IP I"
    },
    {
      from_port = 22
      to_port   = 22
      protocol  = "tcp"
      cidr_block = [
          "10.71.1.8/32",
          "10.71.1.66/32"
      ]
      description = "Whitelist for SSH JUMPHOST"
    }
  ]
}

variable "sf_winjump_ingress_rules" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_block  = list(string)
    description = string
  }))
  default = [
    {
      from_port = 3389
      to_port   = 3389
      protocol  = "tcp"
      cidr_block = [
          "45.122.253.2/32"
      ]
      description = "Whitelist Windows JUMPHOST for permitted IP I"
    }
  ]

}

variable "sf_nfs_ingress_rules" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_block  = list(string)
    description = string
  }))
  default = [
    {
      from_port = 2049
      to_port   = 2049
      protocol  = "tcp"
      cidr_block = [
          "10.71.1.10/32",
          "10.71.2.10/32",
          "10.71.1.14/32"
      ]
      description = "Whitelist NFS for permitted IP"
    }
  ]
}
variable "sf_app_ingress_rules" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_block  = list(string)
    description = string
  }))
  default = [
    {
      from_port = 8080
      to_port   = 8080
      protocol  = "tcp"
      cidr_block = [
          "10.71.1.8/32",
          "10.71.1.11/32", 
          "10.71.2.11/32"
      ]
      description = "Whitelist app port for NGINX"
    },
    {
      from_port = 22
      to_port   = 22
      protocol  = "tcp"
      cidr_block = [
          "10.71.1.8/32", 
          "172.24.0.0/25"
      ]
      description = "Whitelist SSH for permitted IP"
    }
  ]
}

variable "sf_alb_ingress_rules" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_block  = list(string)
    description = string
  }))
  default = [
    {
      from_port = 443
      to_port   = 443
      protocol  = "tcp"
      cidr_block = [
          "10.71.1.8/32",
          "205.252.40.179/32", #IP public of loadbalancer in SG
          "118.143.215.228/32", #IP public of loadbalancer in HK
          "1.55.214.64/32" #IP public of TPB JUMP
      ]
      description = "Whitelist 443 for HKPA ELB and SGPA ELB"
    },
    {
      from_port = 80
      to_port   = 80
      protocol  = "tcp"
      cidr_block = [
          "10.71.1.8/32",
          "205.252.40.179/32", #IP public of loadbalancer in SG
          "118.143.215.228/32", #IP public of loadbalancer in HK
          "1.55.214.64/32" #IP public of TPB JUMP
      ]
      description = "Whitelist 80 for HKPA ELB and SGPA ELB"
    }
  ]
}

variable "sf_common_egress_rules" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_block  = list(string)
    description = string
  }))
  default = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_block  = ["0.0.0.0/0"]
      description = "all traffic out"
    }
  ]
} 