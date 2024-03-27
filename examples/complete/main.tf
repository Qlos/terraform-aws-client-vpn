data "aws_availability_zones" "available" {}

locals {
  vpc_cidr = "10.0.0.0/16"
  azs      = slice(data.aws_availability_zones.available.names, 0, 3)

  client_cidr_block                                 = "10.50.0.0/22"
  authentication_options_type                       = "certificate-authentication"
  target_network_cidr                               = module.vpc.vpc_cidr_block
  server_certificate_arn                            = var.acm_server_arn
  authentication_options_root_certificate_chain_arn = var.acm_client_arn
}

module "client_vpn_label" {
  source  = "cloudposse/label/null"
  version = "v0.25.0"

  namespace  = "app"
  stage      = "prod"
  name       = "vpn"
  attributes = ["private"]
  delimiter  = "-"

  tags = {
    "BuisinesUnit" = "XYZ"
  }
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "v5.1.2"

  name = join(module.client_vpn_label.delimiter, [module.client_vpn_label.stage, module.client_vpn_label.name, var.name, "vpc"])

  cidr = local.vpc_cidr
  azs  = local.azs

  public_subnets = [for k, v in local.azs : cidrsubnet(local.vpc_cidr, 4, k)]

  tags = module.client_vpn_label.tags
}

module "security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 4.0"

  name        = join(module.client_vpn_label.delimiter, [module.client_vpn_label.stage, module.client_vpn_label.name, var.name, "sg"])
  description = "Security group for example usage with Client VPN"
  vpc_id      = module.vpc.vpc_id

  ingress_with_cidr_blocks = [
    {
      from_port   = 1194
      to_port     = 1194
      protocol    = "tcp"
      description = "VPN port"
      cidr_blocks = "0.0.0.0/0"
    }
  ]
  egress_rules = ["all-all"]

  tags = module.client_vpn_label.tags
}

module "client_vpn" {
  source = "../.."
  name   = join(module.client_vpn_label.delimiter, [module.client_vpn_label.stage, module.client_vpn_label.name, var.name])

  server_certificate_arn                            = local.server_certificate_arn
  authentication_options_type                       = local.authentication_options_type
  authentication_options_root_certificate_chain_arn = local.authentication_options_root_certificate_chain_arn

  security_group_ids     = [module.security_group.security_group_id]
  vpc_id                 = module.vpc.vpc_id
  subnet_id              = element(module.vpc.public_subnets, 0)
  client_cidr_block      = local.client_cidr_block
  vpn_port               = 1194
  transport_protocol     = "tcp"
  split_tunnel           = true
  target_network_cidr    = local.target_network_cidr
  authorize_all_groups   = true
  destination_cidr_block = "0.0.0.0/0"
  tags                   = module.client_vpn_label.tags
}
