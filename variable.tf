# variables.tf
# variable "access_key" {
#   default = ".."
# }
# variable "secret_key" {
#   default = "xx"
# }
variable "region" {
  default = "ap-southeast-1"
}
variable "environmentName" {
  default = "prod"
}
# variable "availabilityZone" {
# #  default = ["ap-southeast-1a","ap-southeast-1b"]
#   default = "ap-southeast-1a"
# }
# AMI 
variable "default_ami" {
  default = "ami-03ca998611da0fe12"
}
variable "vpc_cidr_block" {
  default = "10.71.0.0/16"
}
# variable "public_subnet" {
#   default = "10.70.0.0/24"
# }
# variable "private_subnet" {
#   default = "10.70.2.0/24"
# }
variable "common_tags" {
  type = map(string)
  default = {
    "project" = "ge"
    "env"     = "prod"
  }
}

# NACL rules

variable "nacl_rules" {
  type = list(object({
    rule_number = number
    egress      = bool
    protocol    = string
    rule_action = string
    cidr_block  = string
    from_port   = number
    to_port     = number
    icmp_type   = number
    icmp_code   = number
  }))
  default = [
    {
      rule_number = 101
      egress      = false
      protocol    = "icmp"
      rule_action = "allow"
      cidr_block  = "0.0.0.0/0"
      from_port   = -1
      to_port     = -1
      icmp_code   = -1
      icmp_type   = -1
    },
    {
      rule_number = 102
      egress      = false
      protocol    = "tcp"
      rule_action = "allow"
      cidr_block  = "0.0.0.0/0"
      from_port   = 22
      to_port     = 22
      icmp_type   = -1
      icmp_code   = -1
    },
    {
      rule_number = 103
      egress      = false
      protocol    = "tcp"
      rule_action = "allow"
      cidr_block  = "0.0.0.0/0"
      from_port   = 443
      to_port     = 443
      icmp_type   = -1
      icmp_code   = -1
    },
    {
      rule_number = 104
      egress      = false
      protocol    = "tcp"
      rule_action = "allow"
      cidr_block  = "0.0.0.0/0"
      from_port   = 3390
      to_port     = 3390
      icmp_type   = -1
      icmp_code   = -1
    },
    {
      rule_number = 105
      egress      = false
      protocol    = "tcp"
      rule_action = "allow"
      cidr_block  = "0.0.0.0/0"
      from_port   = 3389
      to_port     = 3389
      icmp_type   = -1
      icmp_code   = -1
    },
    {
      rule_number = 108
      egress      = false
      protocol    = "tcp"
      rule_action = "allow"
      cidr_block  = "0.0.0.0/0" 
      from_port   = 80
      to_port     = 80
      icmp_type   = -1
      icmp_code   = -1
    },
    {
      rule_number = 109
      egress      = false
      protocol    = "tcp"
      rule_action = "allow"
      cidr_block  = "0.0.0.0/0" 
      from_port   = 123
      to_port     = 123
      icmp_type   = -1
      icmp_code   = -1
    },
    {
      rule_number = 300
      egress      = false
      protocol    = "tcp"
      rule_action = "allow"
      cidr_block  = "0.0.0.0/0"
      from_port   = 1024
      to_port     = 65535
      icmp_type   = -1
      icmp_code   = -1
    },
    {
      rule_number = 101
      egress      = true
      protocol    = "icmp"
      rule_action = "allow"
      cidr_block  = "0.0.0.0/0"
      from_port   = -1
      to_port     = -1
      icmp_code   = -1
      icmp_type   = -1
    },
    {
      rule_number = 102
      egress      = true
      protocol    = "tcp"
      rule_action = "allow"
      cidr_block  = "0.0.0.0/0"
      from_port   = 22
      to_port     = 22
      icmp_type   = -1
      icmp_code   = -1
    },
    {
      rule_number = 200
      egress      = true
      protocol    = "tcp"
      rule_action = "allow"
      cidr_block  = "0.0.0.0/0"
      from_port   = 80
      to_port     = 80
      icmp_type   = -1
      icmp_code   = -1
    },
    {
      rule_number = 201
      egress      = true
      protocol    = "tcp"
      rule_action = "allow"
      cidr_block  = "0.0.0.0/0"
      from_port   = 443
      to_port     = 443
      icmp_type   = -1
      icmp_code   = -1
    },
    {
      rule_number = 300
      egress      = true
      protocol    = "tcp"
      rule_action = "allow"
      cidr_block  = "0.0.0.0/0"
      from_port   = 1024
      to_port     = 65535
      icmp_type   = -1
      icmp_code   = -1
    },
    {
      rule_number = 333
      egress      = false
      protocol    = "tcp"
      rule_action = "allow"
      cidr_block  = "0.0.0.0/0"
      from_port   = 700
      to_port     = 700
      icmp_type   = -1
      icmp_code   = -1
    },
    {
      rule_number = 105
      egress      = false
      protocol    = "tcp"
      rule_action = "allow"
      cidr_block  = "0.0.0.0/0"
      from_port   = 3389
      to_port     = 3389
      icmp_type   = -1
      icmp_code   = -1
    },
    {
      rule_number = 106
      egress      = false
      protocol    = "tcp"
      rule_action = "allow"
      cidr_block  = "10.70.0.0/16"
      from_port   = 80
      to_port     = 80
      icmp_type   = -1
      icmp_code   = -1
    },
    {
      rule_number = 107
      egress      = false
      protocol    = "tcp"
      rule_action = "allow"
      cidr_block  = "10.70.0.0/16"
      from_port   = 443
      to_port     = 443
      icmp_type   = -1
      icmp_code   = -1
    },
    {
      rule_number = 301
      egress      = true
      protocol    = "tcp"
      rule_action = "allow"
      cidr_block  = "0.0.0.0/0" #email to oneconect.cn and aws
      from_port   = 25
      to_port     = 25
      icmp_type   = -1
      icmp_code   = -1
    },
    {
      rule_number = 302
      egress      = true
      protocol    = "tcp"
      rule_action = "allow"
      cidr_block  = "0.0.0.0/0" #email to oneconect.cn and aws
      from_port   = 465
      to_port     = 465
      icmp_type   = -1
      icmp_code   = -1
    }
  ]
}

# NACL Hardened rules

variable "nacl_hardened_rules" {
  type = list(object({
    rule_number = number
    egress      = bool
    protocol    = string
    rule_action = string
    cidr_block  = string
    from_port   = number
    to_port     = number
    icmp_type   = number
    icmp_code   = number
  }))
  default = [
    {
      rule_number = 101
      egress      = false
      protocol    = "icmp"
      rule_action = "allow"
      cidr_block  = "0.0.0.0/0"
      from_port   = -1
      to_port     = -1
      icmp_code   = -1
      icmp_type   = -1
    },
    {
      rule_number = 102
      egress      = false
      protocol    = "tcp"
      rule_action = "allow"
      cidr_block  = "0.0.0.0/0"
      from_port   = 22
      to_port     = 22
      icmp_type   = -1
      icmp_code   = -1
    },
    {
      rule_number = 103
      egress      = false
      protocol    = "tcp"
      rule_action = "allow"
      cidr_block  = "0.0.0.0/0"
      from_port   = 443
      to_port     = 443
      icmp_type   = -1
      icmp_code   = -1
    },
    {
      rule_number = 104
      egress      = false
      protocol    = "tcp"
      rule_action = "allow"
      cidr_block  = "0.0.0.0/0"
      from_port   = 3390
      to_port     = 3390
      icmp_type   = -1
      icmp_code   = -1
    },
    {
      rule_number = 105
      egress      = false
      protocol    = "tcp"
      rule_action = "allow"
      cidr_block  = "0.0.0.0/0"
      from_port   = 3389
      to_port     = 3389
      icmp_type   = -1
      icmp_code   = -1
    },
    {
      rule_number = 106
      egress      = false
      protocol    = "tcp"
      rule_action = "allow"
      cidr_block  = "0.0.0.0/0" 
      from_port   = 80
      to_port     = 80
      icmp_type   = -1
      icmp_code   = -1
    },
    {
      rule_number = 300
      egress      = false
      protocol    = "tcp"
      rule_action = "allow"
      cidr_block  = "0.0.0.0/0"
      from_port   = 1024
      to_port     = 65535
      icmp_type   = -1
      icmp_code   = -1
    },
    {
      rule_number = 333
      egress      = false
      protocol    = "tcp"
      rule_action = "allow"
      cidr_block  = "0.0.0.0/0"
      from_port   = 700
      to_port     = 700
      icmp_type   = -1
      icmp_code   = -1
    },
    {
      rule_number = 444
      egress      = false
      protocol    = "tcp"
      rule_action = "allow"
      cidr_block  = "0.0.0.0/0"
      from_port   = 465
      to_port     = 465
      icmp_type   = -1
      icmp_code   = -1
    },
    {
      rule_number = 101
      egress      = true
      protocol    = "icmp"
      rule_action = "allow"
      cidr_block  = "0.0.0.0/0"
      from_port   = -1
      to_port     = -1
      icmp_code   = -1
      icmp_type   = -1
    },
    {
      rule_number = 102
      egress      = true
      protocol    = "tcp"
      rule_action = "allow"
      cidr_block  = "0.0.0.0/0"
      from_port   = 22
      to_port     = 22
      icmp_type   = -1
      icmp_code   = -1
    },
    {
      rule_number = 200
      egress      = true
      protocol    = "tcp"
      rule_action = "allow"
      cidr_block  = "0.0.0.0/0"
      from_port   = 80
      to_port     = 80
      icmp_type   = -1
      icmp_code   = -1
    },
    {
      rule_number = 201
      egress      = true
      protocol    = "tcp"
      rule_action = "allow"
      cidr_block  = "0.0.0.0/0"
      from_port   = 443
      to_port     = 443
      icmp_type   = -1
      icmp_code   = -1
    },
    {
      rule_number = 300
      egress      = true
      protocol    = "tcp"
      rule_action = "allow"
      cidr_block  = "0.0.0.0/0"
      from_port   = 1024
      to_port     = 65535
      icmp_type   = -1
      icmp_code   = -1
    },
    {
      rule_number = 301
      egress      = true
      protocol    = "tcp"
      rule_action = "allow"
      cidr_block  = "0.0.0.0/0"
      from_port   = 25
      to_port     = 25
      icmp_type   = -1
      icmp_code   = -1
    },
    {
      rule_number = 302
      egress      = true
      protocol    = "tcp"
      rule_action = "allow"
      cidr_block  = "0.0.0.0/0"
      from_port   = 465
      to_port     = 465
      icmp_type   = -1
      icmp_code   = -1
    },
    {
      rule_number = 400
      egress      = true
      protocol    = "tcp"
      rule_action = "allow"
      cidr_block  = "0.0.0.0/0"
      from_port   = 3389
      to_port     = 3392
      icmp_type   = -1
      icmp_code   = -1
    }
  ]
}

# DMZ rules

# variable "dmz_ingress_rules" {
#   type = list(object({
#     from_port   = number
#     to_port     = number
#     protocol    = string
#     cidr_block  = list(string)
#     description = string
#   }))
#   default = [
#     {
#       from_port = 22
#       to_port   = 22
#       protocol  = "tcp"
#       cidr_block = [
#         "123.24.130.228/32",
#         "245.122.253.2/32",
#         "10.71.1.0/25"
#       ]
#       description = "ssh port in"
#     },
#     {
#       from_port = 3389
#       to_port   = 3389
#       protocol  = "tcp"
#       cidr_block = [
#         "245.122.253.2/32"
#       ]
#       description = "xrdp port in"
#     },
#     {
#       from_port = 700
#       to_port   = 700
#       protocol  = "tcp"
#       cidr_block = [
#         "245.122.253.2/32"
#       ]
#       description = "ssh port in"
#     },
#     {
#       from_port = 3390
#       to_port   = 3390
#       protocol  = "tcp"
#       cidr_block = [
#         "245.122.253.2/32"
#       ]
#       description = "xrdp port in"
#     },
#     {
#       from_port = 443
#       to_port   = 443
#       protocol  = "tcp"
#       cidr_block = [
#         "245.122.253.2/32"
#       ]
#       description = "https port in"
#     }
#   ]
# }

# variable "dmz_egress_rules" {
#   type = list(object({
#     from_port   = number
#     to_port     = number
#     protocol    = number
#     cidr_block  = list(string)
#     description = string
#   }))
#   default = [
#     {
#       from_port   = 0
#       to_port     = 0
#       protocol    = -1
#       cidr_block  = ["0.0.0.0/0"]
#       description = "all traffic out"
#     }
#   ]
# }


# SF hardened rules

variable "sf_hardened_ingress_rules" {
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
          "10.71.1.8/32"
      ]
      description = "SSH from permitted IP I"
    },
    
    {
      from_port = 3389
      to_port   = 3389
      protocol  = "tcp"
      cidr_block = [
          "245.122.253.2/32"
          ]
      description = "RDP from Permitted IP 1"
    },
    
    {
      from_port = 0
      to_port   = 65535
      protocol  = "all"
      cidr_block = [
          "10.71.1.0/25",
          "10.71.10.0/25"
      ]
      description = "All traffic from subnets and peering"
    }
  ]
}

variable "sf_hardened_egress_rules" {
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

variable "default_centos_ami" {
  default = "ami-03ca998611da0fe12" # centos 7 default image
}
 variable "PUBLIC_KEY_PATH" {
   default = "/root/.ssh/id_rsa.pub"
 }

 variable "PRIVATE_KEY_PATH" {
   default = "/root/.ssh/id_rsa"
 }
variable "ec2_sf" {
  default = {
    "PROD-SF-GE-COMMON-BH-1" = {
      iam_instance_profile   = "RoleforBH",
      ami             = "ami-03ca998611da0fe12",
      key_name        = "",
      snapshot_id     = "",
      #vpc_security_group_ids = "SF_Hardened_Security_Group",
      private_dns     = "PROD-GE-COMMON-BH-1",
      private_ip      = "10.71.1.8",
      instance_type   = "t2.micro",
      root_volume_size = "60"
      ebs_volume_size = "50",
    }
     "PROD-SF-GE-APP-1" = {
       iam_instance_profile   = "RoleforPRODuploadS3",
       ami             = "ami-03ca998611da0fe12"
       key_name        = "prod-ge-key-pair01"
       snapshot_id     = ""
       #vpc_security_group_ids = "sg-03bad314f0ee0ca0b",
       private_dns     = "PROD-SF-GE-APP-1",
       private_ip      = "10.71.1.10",
       instance_type   = "t3.micro",
       root_volume_size = "50"
       ebs_volume_size = "100",
    }
    
    "PROD-DMZ-GE-WEBPORTAL-1" = {
      iam_instance_profile   = "",
      ami             = "ami-03ca998611da0fe12"
      key_name        = "prod-ge-key-pair01"
      snapshot_id     = ""
      #vpc_security_group_ids = "sg-02e5bbd1a0ea13341",
      private_dns     = "PROD-DMZ-GE-WEBPORTAL-1",
      private_ip      = "10.71.1.11",
      instance_type   = "t3.micro",
      root_volume_size = "50"
      ebs_volume_size = "100",  

    }
     "PROD-DMZ-GE-MFTAPP-1" = {
       iam_instance_profile   = "RoleforPRODuploadS3",
       ami             = "ami-03ca998611da0fe12"
       key_name        = "prod-ge-key-pair01"
       snapshot_id     = ""
       #vpc_security_group_ids = "sg-028b82a5152c3c143",
       private_dns     = "PROD-DMZ-GE-MFTAPP-1",
       private_ip      = "10.71.1.14",
       instance_type   = "t3.micro",
       root_volume_size = "50"
       ebs_volume_size = "100", 
     }
  }
}

variable "ec2_sf1" {
  default = {
     "PROD-DMZ-GE-WEBPORTAL-2" = {
       iam_instance_profile   = "",
       ami             = "ami-03ca998611da0fe12"
       key_name        = "prod-ge-key-pair01"
       snapshot_id     = ""
      # vpc_security_group_ids = "sg-02e5bbd1a0ea13341",
       private_dns     = "PROD-DMZ-GE-WEBPORTAL-2",
       private_ip      = "10.71.2.11",
       instance_type   = "t3.micro",
       root_volume_size = "50"
       ebs_volume_size = "100",
      }  
     "PROD-SF-GE-APP-2" = {
       iam_instance_profile   = "RoleforPRODuploadS3",
       ami             = "ami-03ca998611da0fe12"
       key_name        = "prod-ge-key-pair01"
       snapshot_id     = ""
      # vpc_security_group_ids = "sg-03bad314f0ee0ca0b",
       private_dns     = "PROD-SF-GE-APP-2",
       private_ip      = "10.71.2.10",
       instance_type   = "t3.micro",
       root_volume_size = "50"
       ebs_volume_size = "100",

    }
  }
}

# Variable for ELB  #########################

variable "lb_target_group" {
  default = {
    "PROD-SFTP" = {
      name     = "prod-sftp"
      port     = 22
      protocol = "TCP"
    # },
    # "XRDP-BH" = {
    #   name     = "xrdp-backend-lb-tg"
    #   port     = 3389
    #   protocol = "TCP"
     },
    "PROD-WEB-PORTAL" = {
      name     = "PROD-WEB-PORTAL"
      port     = 80
      protocol = "TCP"
    # # },
    # "RDP-PERFTEST-1" = {
    #   name     = "rdp-1-backend-lb-tg"
    #   port     = 3389
    #   protocol = "TCP"
    }
  }
}

variable "lb_target_group_attachment" {
  default = {
    "PROD-SFTP" = {
      name   = "PROD-SFTP"
      vmname = "PROD-DMZ-GE-MFTAPP-1"
      port   = 22
     },
     "PROD-WEB-PORTAL" = {
       name   = "PROD-WEB-PORTAL"
       vmname = "PROD-DMZ-GE-WEBPORTAL-1"
       port   = 80
    #  },
    #  "WEB-PORTAL" = {
    #    name   = "WEB-PORTAL"
    #    vmname = "PROD-DMZ-GE-WEBPORTAL-2"
    #    port   = 80
    }
  }
}
#variable for VM in 1b AZ
variable "lb_target_group_attachment_az1b" {
  default = {
     "PROD-WEB-PORTAL" = {
       name   = "PROD-WEB-PORTAL"
       vmname = "PROD-DMZ-GE-WEBPORTAL-2"
       port   = 80
    #  },
    #  "WEB-PORTAL" = {
    #    name   = "WEB-PORTAL"
    #    vmname = "PROD-DMZ-GE-WEBPORTAL-2"
    #    port   = 80
    }
  }
}

variable "public_nlb" {
  default = {
    "PROD-GE-PUBLIC-ELB01" = {
      name               = "PROD-GE-PUBLIC-ELB01"
      eip                = "PROD-GE-PUBLIC-ELB01"
      load_balancer_type = "network"
    #  },
    #  "GE-PUBLIC-ELB02" = {
    #    name               = "GE-PUBLIC-ELB02"
    #    eip                = "GE-PUBLIC-ELB02"
    #    load_balancer_type = "application"
    # },
    # "DYNATRACE-NLB-CLUSTER" = {
    #   name               = "DYNATRACE-NLB-CLUSTER"
    #   eip                = "DYNATRACE-NLB-CLUSTER"
    #   load_balancer_type = "network"
    # },
    # "RDP-PERFTEST" = {
    #   name               = "RDP-PERFTEST"
    #   eip                = "RDP-PERFTEST"
    #   load_balancer_type = "network"
    }
  }
}

variable "nlb_eip" {
  default = {
    "PROD-GE-PUBLIC-ELB01" = {
      vpc = true
    #  },
    #  "GE-PUBLIC-ELB02" = {
    #    vpc = true
    # },
    # "DYNATRACE-NLB-CLUSTER" = {
    #   vpc = true
    # },
    # "RDP-PERFTEST" = {
    #   vpc = true
    }
  }
}

variable "lb_listener_tcp" {
  default = {
    "SFTP" = {
      nlb          = "PROD-GE-PUBLIC-ELB01"
      port         = 22
      protocol     = "TCP"
      type         = "forward"
      target_group = "PROD-SFTP"
      # },
#     "WEB-HTTP" = {
#       nlb          = "GE-PUBLIC-ELB01"
#       port         = 80
#       protocol     = "http"
#       default_action {
#         type         = "redirect"
#         redirect {
#           port         = "443"
#           protocol     = "HTTPS"
#           status_code = "HTTP_301"
# #          target_group = "WEB-PORTAL"
#         }
#       }
    }
  }
}

variable "lb_listener_web" {
  default = {
    # "SFTP" = {
    #   nlb          = "GE-PUBLIC-ELB01"
    #   port         = 22
    #   protocol     = "TCP"
    #   type         = "forward"
    #   target_group = "SFTP"
    #  },
     "PROD-WEB-PORTAL" = {
       nlb          = "PROD-GE-PUBLIC-ELB01"
       port         = 443
       protocol     = "TLS"
       type         = "forward"
       target_group = "PROD-WEB-PORTAL"
    }
  }
}