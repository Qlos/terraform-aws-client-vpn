output "id" {
  value       = aws_ec2_client_vpn_endpoint.this.id
  description = "The ID of the Client VPN."
}

output "arn" {
  value       = aws_ec2_client_vpn_endpoint.this.arn
  description = "The ARN of the Client VPN."
}

output "dns_name" {
  value       = aws_ec2_client_vpn_endpoint.this.dns_name
  description = "The DNS name to be used by clients when establishing their VPN session."
}

output "self_service_portal_url" {
  value       = try(aws_ec2_client_vpn_endpoint.this.self_service_portal_url, null)
  description = "The URL of the self-service portal."
}
