module "dev_networking" {
  source = "../../modules/networking"

  network_name    = "enterprise-net-${var.environment}"
  ip_range        = "10.10.0.0/16"
  subnet_ip_range = "10.10.1.0/24"
  network_zone    = "eu-central"
}

module "dev_compute" {
  source = "../../modules/compute"

  server_name        = "app-server-${var.environment}"
  server_type        = "cx23"
  image              = "ubuntu-22.04"
  location           = "nbg1"
  ssh_key_name       = "ter-to-hertzner"
  public_key         = var.ssh_public_key
  private_network_id = module.dev_networking.network_id
}
