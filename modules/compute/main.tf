terraform {
  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "~> 1.45"
    }
  }
}

data "hcloud_ssh_key" "existing_key" {
  name = var.ssh_key_name
}

resource "hcloud_server" "app_server" {
  name        = var.server_name
  server_type = var.server_type
  image       = var.image
  location    = var.location
  
  ssh_keys    = [data.hcloud_ssh_key.existing_key.id]

  network {
    network_id = var.private_network_id
  }

  lifecycle {
    create_before_destroy = true
  }

  user_data = <<-EOF
              #!/bin/bash
              apt-get update -y
              apt-get upgrade -y
              EOF
}
