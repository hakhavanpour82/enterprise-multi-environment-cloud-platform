output "network_id" {
  value       = hcloud_network.private_network.id
  description = "The ID of the created private network"
}

output "subnet_ip_range" {
  value       = hcloud_network_subnet.private_subnet.ip_range
  description = "The IP range of the created subnet"
}
