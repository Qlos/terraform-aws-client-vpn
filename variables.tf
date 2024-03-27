variable "name" {
  type        = string
  default     = null
  description = "Client VPN name"
}

variable "description" {
  type        = string
  default     = null
  description = "Client VPN description"
}

variable "server_certificate_arn" {
  type        = string
  default     = null
  description = "ARN of the AWS Certificate Manager (ACM) server certificate"
}

variable "client_cidr_block" {
  type        = string
  default     = null
  description = "The IPv4 address range in CIDR notation to assign client IP addresses. Cannot overlap with VPC subnet"
}

variable "client_connect_options_enabled" {
  type        = bool
  default     = false
  description = "Indicates whether client connect options are enabled"
}

variable "client_connect_options_lambda_function_arn" {
  type        = string
  default     = null
  description = "ARN of the Lambda function used for connection authorization"
}

variable "client_login_banner_options_banner_text" {
  type        = bool
  default     = false
  description = "Enable or disable custom text banner that will be displayed on AWS VPN clients when VPN session is established"
}

variable "client_login_banner_options_enabled" {
  type        = string
  default     = null
  description = "Customizable text when VPN session is established. Max of 1400 chars"
}

variable "dns_servers" {
  type        = list(string)
  default     = []
  description = "Information which DNS servers will be used. Max 2 DNS severs. If not specified connecting device DNS servers are used"
}

variable "security_group_ids" {
  type        = list(string)
  default     = []
  description = "IDs of associated security groups"
}

variable "self_service_portal" {
  type        = string
  default     = "disabled"
  description = "Enables or disables self-service portal for the Client VPN endpoint"
}

variable "session_timeout_hours" {
  type        = string
  default     = 24
  description = "Maximum session duration. Valid values are: 8,10,12 or 24"
}

variable "split_tunnel" {
  type        = bool
  default     = false
  description = "If true, enables split tunnel"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "A mapping of tags to assign to the resource."
}

variable "transport_protocol" {
  type        = string
  default     = null
  description = "Protocol used to connect. Can be tcp or udp. AWS default is udp"
}

variable "vpc_id" {
  type        = string
  default     = null
  description = "ID of the VPC where VPN is created"
}

variable "vpn_port" {
  type        = string
  default     = 443
  description = "Port used to VPN connection. Can be 443 or 1194"
}

variable "authentication_options_type" {
  type        = string
  default     = null
  description = "Required variable. Specify authentication type. Valid values are: certificate-authentication, directory-service-authentication or federated-authentication"
}

variable "authentication_options_active_directory_id" {
  type        = string
  default     = null
  description = "ID of Active Directory used for authentication. Used if authentication type is set to directory-service-authentication"
}

variable "authentication_options_root_certificate_chain_arn" {
  type        = string
  default     = null
  description = "ARN of the cert used on client side, cert must be stored in AWS Certificate Manager (ACM). Used if authentication type is set to certificate-authentication"
}

variable "authentication_options_saml_provider_arn" {
  type        = string
  default     = null
  description = "ARN of the IAM SAML identity provider. Used if authentication type is set to federated-authentication"
}

variable "authentication_options_self_service_saml_provider_arn" {
  type        = string
  default     = null
  description = "ARN of the IAM SAML identity provider for the self service portal. Used if authentication type is set to federated-authentication"
}

variable "connection_log_options_enabled" {
  type        = bool
  default     = false
  description = "Indicates whether connection logging is enabled"
}

variable "connection_log_options_cloudwatch_log_group" {
  type        = string
  default     = null
  description = "The name of the CloudWatch Logs group"
}

variable "connection_log_options_cloudwatch_log_stream" {
  type        = string
  default     = null
  description = "The name of the CloudWatch Logs stream to which the connection data is published"
}

variable "target_network_cidr" {
  type        = string
  default     = null
  description = "The IPv4 range of the network to which the authorization rule applies"
}

variable "authorize_all_groups" {
  type        = bool
  default     = false
  description = "Indicates whether the authorization rule grants access to all clients"
}

variable "access_group_id" {
  type        = string
  default     = null
  description = "ID of the group to which the authorization rule grants access. Define if authorize_all_groups not true"
}

variable "authorization_rule_description" {
  type        = string
  default     = null
  description = "Description of the authorization rule"
}

variable "subnet_id" {
  type        = string
  default     = null
  description = "The ID of the subnet to associate with the Client VPN endpoint"
}

variable "destination_cidr_block" {
  type        = string
  default     = null
  description = "The IPv4 range of the route destination"
}

variable "route_description" {
  type        = string
  default     = null
  description = "Description of the route"
}
