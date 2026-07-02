terraform {
  required_version = ">= 1.5.0"

  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "~> 1.45"
    }
  }

  backend "local" {
    path = "terraform.tfstate"
  }
}

provider "hcloud" {
  token = var.hcloud_token
}
