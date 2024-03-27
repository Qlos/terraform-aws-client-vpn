output "id" {
  value       = module.client_vpn.id
  description = "The ID of the Client VPN."
}

output "arn" {
  value       = module.client_vpn.arn
  description = "The ARN of the Client VPN."
}

output "dns_name" {
  value       = module.client_vpn.dns_name
  description = "The DNS name to be used by clients when establishing their VPN session."
}

output "self_service_portal_url" {
  value       = try(module.client_vpn.self_service_portal_url, null)
  description = "The URL of the self-service portal."
}
