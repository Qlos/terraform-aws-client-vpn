variable "region" {
  type        = string
  description = "Region to create Client VPN"
}

variable "name" {
  type        = string
  description = "Name of Client VPN"
}

variable "acm_server_arn" {
  type        = string
  description = "ARN of ACM certificate used on server side"
}

variable "acm_client_arn" {
  type        = string
  description = "ARN of ACM certificate used by clients or as CA certificate of clients certificates"
}
