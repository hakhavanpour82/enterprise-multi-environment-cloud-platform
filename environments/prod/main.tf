module "prod_networking" {
  source = "../../modules/networking"

  network_name    = "enterprise-net-${var.environment}"
  ip_range        = "10.20.0.0/16" 
  subnet_ip_range = "10.20.1.0/24"
  network_zone    = "eu-central"
}

module "prod_compute" {
  source   = "../../modules/compute"
  for_each = var.production_servers

  server_name        = "app-${each.key}-${var.environment}"
  server_type        = each.value.server_type
  location           = each.value.location
  image              = "ubuntu-22.04"
  ssh_key_name       = "admin-key-${each.key}-${var.environment}"
  public_key         = var.ssh_public_key
  private_network_id = module.prod_networking.network_id
}
