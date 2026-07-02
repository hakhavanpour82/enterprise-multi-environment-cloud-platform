variable "hcloud_token" {
  type        = string
  description = "The API token for Hetzner Cloud Production Account"
  sensitive   = true
}

variable "environment" {
  type        = string
  description = "The deployment environment name"
  default     = "prod"
}

variable "ssh_public_key" {
  type        = string
  description = "The public SSH key for production root access"
}

variable "production_servers" {
  type = map(object({
    server_type = string
    location    = string
  }))
  description = "A map of production servers to create for high availability"
}
