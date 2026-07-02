output "dev_server_public_ip" {
  value       = module.dev_compute.server_public_ip
  description = "The public IP of the development server"
}

output "dev_network_id" {
  value       = module.dev_networking.network_id
  description = "The ID of the development private network"
}
