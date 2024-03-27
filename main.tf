resource "aws_ec2_client_vpn_endpoint" "this" {
  description            = var.description
  server_certificate_arn = var.server_certificate_arn
  client_cidr_block      = var.client_cidr_block
  dns_servers            = var.dns_servers
  security_group_ids     = var.security_group_ids
  self_service_portal    = var.self_service_portal
  session_timeout_hours  = var.session_timeout_hours
  split_tunnel           = var.split_tunnel
  tags                   = merge(var.tags, { "Name" = var.name })
  transport_protocol     = var.transport_protocol
  vpc_id                 = var.vpc_id
  vpn_port               = var.vpn_port

  authentication_options {
    type                           = var.authentication_options_type
    active_directory_id            = var.authentication_options_active_directory_id
    root_certificate_chain_arn     = var.authentication_options_root_certificate_chain_arn
    saml_provider_arn              = var.authentication_options_saml_provider_arn
    self_service_saml_provider_arn = var.authentication_options_self_service_saml_provider_arn
  }

  client_connect_options {
    enabled             = var.client_connect_options_enabled
    lambda_function_arn = var.client_connect_options_lambda_function_arn
  }

  client_login_banner_options {
    banner_text = var.client_login_banner_options_banner_text
    enabled     = var.client_login_banner_options_enabled
  }
  connection_log_options {
    enabled               = var.connection_log_options_enabled
    cloudwatch_log_group  = var.connection_log_options_cloudwatch_log_group
    cloudwatch_log_stream = var.connection_log_options_cloudwatch_log_stream
  }

}

resource "aws_ec2_client_vpn_authorization_rule" "this" {
  client_vpn_endpoint_id = aws_ec2_client_vpn_endpoint.this.id
  target_network_cidr    = var.target_network_cidr
  authorize_all_groups   = var.authorize_all_groups
  access_group_id        = var.access_group_id
  description            = var.authorization_rule_description

}

resource "aws_ec2_client_vpn_network_association" "this" {
  client_vpn_endpoint_id = aws_ec2_client_vpn_endpoint.this.id
  subnet_id              = var.subnet_id
}

resource "aws_ec2_client_vpn_route" "this" {
  client_vpn_endpoint_id = aws_ec2_client_vpn_endpoint.this.id
  target_vpc_subnet_id   = aws_ec2_client_vpn_network_association.this.subnet_id
  destination_cidr_block = var.destination_cidr_block
  description            = var.route_description
}
