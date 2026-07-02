variable "hcloud_token" {
  type        = string
  description = "The API token for Hetzner Cloud Account"
  sensitive   = true
}

variable "environment" {
  type        = string
  description = "The deployment environment name"
  default     = "dev"
}

variable "ssh_public_key" {
  type        = string
  description = "The public SSH key for server root access"
}
