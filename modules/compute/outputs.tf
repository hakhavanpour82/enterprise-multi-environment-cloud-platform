output "server_public_ip" {
  value       = hcloud_server.app_server.ipv4_address
  description = "The public IPv4 address of the Hetzner server"
}

output "server_private_ip" {
  value       = hcloud_server.app_server.status
  description = "The status of the server"
}
