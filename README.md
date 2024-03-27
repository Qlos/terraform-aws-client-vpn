
# terraform-aws-client-vpn

This project is **100% Open Source**, build and develop by DevOps Team from [Qlos.com](https://qlos.com)

## About

Terraform module to create [Amazon Client VPN](https://aws.amazon.com/vpn/client-vpn/). AWS Client VPN allows to create secure connection to AWS or on-premises resources.

## License

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

```text
The MIT License (MIT)

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

Source: <https://opensource.org/licenses/MIT>
```
See [LICENSE](LICENSE) for full details.
## Authors

- Marcin Serek | [github](https://github.com/MarcinS-Qlos)


### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

### Modules

No modules.

### Resources

| Name | Type |
|------|------|
| [aws_ec2_client_vpn_authorization_rule.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_client_vpn_authorization_rule) | resource |
| [aws_ec2_client_vpn_endpoint.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_client_vpn_endpoint) | resource |
| [aws_ec2_client_vpn_network_association.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_client_vpn_network_association) | resource |
| [aws_ec2_client_vpn_route.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_client_vpn_route) | resource |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_group_id"></a> [access\_group\_id](#input\_access\_group\_id) | ID of the group to which the authorization rule grants access. Define if authorize\_all\_groups not true | `string` | `null` | no |
| <a name="input_authentication_options_active_directory_id"></a> [authentication\_options\_active\_directory\_id](#input\_authentication\_options\_active\_directory\_id) | ID of Active Directory used for authentication. Used if authentication type is set to directory-service-authentication | `string` | `null` | no |
| <a name="input_authentication_options_root_certificate_chain_arn"></a> [authentication\_options\_root\_certificate\_chain\_arn](#input\_authentication\_options\_root\_certificate\_chain\_arn) | ARN of the cert used on client side, cert must be stored in AWS Certificate Manager (ACM). Used if authentication type is set to certificate-authentication | `string` | `null` | no |
| <a name="input_authentication_options_saml_provider_arn"></a> [authentication\_options\_saml\_provider\_arn](#input\_authentication\_options\_saml\_provider\_arn) | ARN of the IAM SAML identity provider. Used if authentication type is set to federated-authentication | `string` | `null` | no |
| <a name="input_authentication_options_self_service_saml_provider_arn"></a> [authentication\_options\_self\_service\_saml\_provider\_arn](#input\_authentication\_options\_self\_service\_saml\_provider\_arn) | ARN of the IAM SAML identity provider for the self service portal. Used if authentication type is set to federated-authentication | `string` | `null` | no |
| <a name="input_authentication_options_type"></a> [authentication\_options\_type](#input\_authentication\_options\_type) | Required variable. Specify authentication type. Valid values are: certificate-authentication, directory-service-authentication or federated-authentication | `string` | `null` | no |
| <a name="input_authorization_rule_description"></a> [authorization\_rule\_description](#input\_authorization\_rule\_description) | Description of the authorization rule | `string` | `null` | no |
| <a name="input_authorize_all_groups"></a> [authorize\_all\_groups](#input\_authorize\_all\_groups) | Indicates whether the authorization rule grants access to all clients | `bool` | `false` | no |
| <a name="input_client_cidr_block"></a> [client\_cidr\_block](#input\_client\_cidr\_block) | The IPv4 address range in CIDR notation to assign client IP addresses. Cannot overlap with VPC subnet | `string` | `null` | no |
| <a name="input_client_connect_options_enabled"></a> [client\_connect\_options\_enabled](#input\_client\_connect\_options\_enabled) | Indicates whether client connect options are enabled | `bool` | `false` | no |
| <a name="input_client_connect_options_lambda_function_arn"></a> [client\_connect\_options\_lambda\_function\_arn](#input\_client\_connect\_options\_lambda\_function\_arn) | ARN of the Lambda function used for connection authorization | `string` | `null` | no |
| <a name="input_client_login_banner_options_banner_text"></a> [client\_login\_banner\_options\_banner\_text](#input\_client\_login\_banner\_options\_banner\_text) | Enable or disable custom text banner that will be displayed on AWS VPN clients when VPN session is established | `bool` | `false` | no |
| <a name="input_client_login_banner_options_enabled"></a> [client\_login\_banner\_options\_enabled](#input\_client\_login\_banner\_options\_enabled) | Customizable text when VPN session is established. Max of 1400 chars | `string` | `null` | no |
| <a name="input_connection_log_options_cloudwatch_log_group"></a> [connection\_log\_options\_cloudwatch\_log\_group](#input\_connection\_log\_options\_cloudwatch\_log\_group) | The name of the CloudWatch Logs group | `string` | `null` | no |
| <a name="input_connection_log_options_cloudwatch_log_stream"></a> [connection\_log\_options\_cloudwatch\_log\_stream](#input\_connection\_log\_options\_cloudwatch\_log\_stream) | The name of the CloudWatch Logs stream to which the connection data is published | `string` | `null` | no |
| <a name="input_connection_log_options_enabled"></a> [connection\_log\_options\_enabled](#input\_connection\_log\_options\_enabled) | Indicates whether connection logging is enabled | `bool` | `false` | no |
| <a name="input_description"></a> [description](#input\_description) | Client VPN description | `string` | `null` | no |
| <a name="input_destination_cidr_block"></a> [destination\_cidr\_block](#input\_destination\_cidr\_block) | The IPv4 range of the route destination | `string` | `null` | no |
| <a name="input_dns_servers"></a> [dns\_servers](#input\_dns\_servers) | Information which DNS servers will be used. Max 2 DNS severs. If not specified connecting device DNS servers are used | `list(string)` | `[]` | no |
| <a name="input_name"></a> [name](#input\_name) | Client VPN name | `string` | `null` | no |
| <a name="input_route_description"></a> [route\_description](#input\_route\_description) | Description of the route | `string` | `null` | no |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | IDs of associated security groups | `list(string)` | `[]` | no |
| <a name="input_self_service_portal"></a> [self\_service\_portal](#input\_self\_service\_portal) | Enables or disables self-service portal for the Client VPN endpoint | `string` | `"disabled"` | no |
| <a name="input_server_certificate_arn"></a> [server\_certificate\_arn](#input\_server\_certificate\_arn) | ARN of the AWS Certificate Manager (ACM) server certificate | `string` | `null` | no |
| <a name="input_session_timeout_hours"></a> [session\_timeout\_hours](#input\_session\_timeout\_hours) | Maximum session duration. Valid values are: 8,10,12 or 24 | `string` | `24` | no |
| <a name="input_split_tunnel"></a> [split\_tunnel](#input\_split\_tunnel) | If true, enables split tunnel | `bool` | `false` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | The ID of the subnet to associate with the Client VPN endpoint | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the resource. | `map(string)` | `{}` | no |
| <a name="input_target_network_cidr"></a> [target\_network\_cidr](#input\_target\_network\_cidr) | The IPv4 range of the network to which the authorization rule applies | `string` | `null` | no |
| <a name="input_transport_protocol"></a> [transport\_protocol](#input\_transport\_protocol) | Protocol used to connect. Can be tcp or udp. AWS default is udp | `string` | `null` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | ID of the VPC where VPN is created | `string` | `null` | no |
| <a name="input_vpn_port"></a> [vpn\_port](#input\_vpn\_port) | Port used to VPN connection. Can be 443 or 1194 | `string` | `443` | no |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | The ARN of the Client VPN. |
| <a name="output_dns_name"></a> [dns\_name](#output\_dns\_name) | The DNS name to be used by clients when establishing their VPN session. |
| <a name="output_id"></a> [id](#output\_id) | The ID of the Client VPN. |
| <a name="output_self_service_portal_url"></a> [self\_service\_portal\_url](#output\_self\_service\_portal\_url) | The URL of the self-service portal. |

### Examples

```hcl
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
```
