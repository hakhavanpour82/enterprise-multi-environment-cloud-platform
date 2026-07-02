output "prod_servers_public_ips" {
  value       = { for k, v in module.prod_compute : k => v.server_public_ip }
  description = "The map of public IP addresses for all production servers"
}

output "prod_network_id" {
  value       = module.prod_networking.network_id
  description = "The ID of the production private network"
}
