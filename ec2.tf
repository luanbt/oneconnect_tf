locals {
    environment = var.environmentName
}

# ami and snapshot_id can use 'data'

resource "aws_instance" "ec2_sf" {
    for_each = var.ec2_sf
    iam_instance_profile        = each.value.iam_instance_profile != "" ? each.value.iam_instance_profile : null
    ami                         = each.value.ami != "" ? each.value.ami : var.default_centos_ami
    availability_zone           = "ap-southeast-1a"
    disable_api_termination     = "true"
    instance_type               = each.value.instance_type
    key_name                    = each.value.key_name #"ge-key-pair01"
    subnet_id                   = module.vpc.private_subnets[0]
    #vpc_security_group_ids      = each.value.vpc_security_group_ids#[aws_security_group.SF_Hardened_Security_Group.id]
    associate_public_ip_address = false
    private_ip                  = each.value.private_ip

    root_block_device {
        volume_size           = each.value.root_volume_size
    }

    ebs_block_device {
        device_name           = "/dev/sdh"
        snapshot_id           = each.value.snapshot_id != "" ? each.value.snapshot_id : null
        volume_size           = each.value.ebs_volume_size != "" ? each.value.ebs_volume_size : null
    }

    tags = merge({
    for k,v in var.common_tags:
      k => v
    }, {"service"="ec2","Name"=each.key})
}


resource "aws_instance" "ec2_sf1" {
    for_each = var.ec2_sf1
    iam_instance_profile        = each.value.iam_instance_profile != "" ? each.value.iam_instance_profile : null
    ami                         = each.value.ami != "" ? each.value.ami : var.default_centos_ami
    availability_zone           = "ap-southeast-1b"
    disable_api_termination     = "true"
    instance_type               = each.value.instance_type
    key_name                    = each.value.key_name #"ge-key-pair01"
    subnet_id                   = module.vpc.private_subnets[1]
    #vpc_security_group_ids      = each.value.vpc_security_group_ids#[aws_security_group.SF_Hardened_Security_Group.id]
    associate_public_ip_address = false
    private_ip                  = each.value.private_ip

    root_block_device {
        volume_size           = each.value.root_volume_size
    }

    ebs_block_device {
        device_name           = "/dev/sdh"
        snapshot_id           = each.value.snapshot_id != "" ? each.value.snapshot_id : null
        volume_size           = each.value.ebs_volume_size != "" ? each.value.ebs_volume_size : null
    }

    tags = merge({
    for k,v in var.common_tags:
      k => v
    }, {"service"="ec2","Name"=each.key})
}

# resource "aws_instance" "ec2_dmz" {
#     for_each = var.ec2_dmz
#     ami                         = each.value.ami != "" ? each.value.ami : var.default_centos_ami
#     availability_zone           = "ap-southeast-1a"
#     instance_type               = each.value.instance_type
#     key_name                    = each.value.key_name #"ge-key-pair01"
#     subnet_id                   = module.vpc.public_subnets[0]
#     vpc_security_group_ids      = [aws_security_group.DMZ_Security_Group.id]
#     associate_public_ip_address = false
#     private_ip                  = each.value.private_ip

#     root_block_device {
#         volume_size           = each.value.root_volume_size
#     }

#     ebs_block_device {
#         device_name           = "/dev/sdh"
#         snapshot_id           = each.value.snapshot_id != "" ? each.value.snapshot_id : null
#         volume_size           = each.value.ebs_volume_size != "" ? each.value.ebs_volume_size : null
#     }

#     tags = merge({
#     for k,v in var.common_tags:
#       k => v
#     }, {"service"="ec2","Name"=each.key})
# }

  resource "aws_key_pair" "prod-ge-key-pair01" {
      key_name = "prod-ge-key-pair01"
      public_key = file(var.PUBLIC_KEY_PATH)
  }