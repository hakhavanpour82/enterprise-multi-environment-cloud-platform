variable "server_name" {
  type        = string
  description = "The name of the Hetzner cloud server"
}

variable "server_type" {
  type        = string
  description = "The type/size of the server (e.g., cx22, cpx31)"
}

variable "image" {
  type        = string
  description = "The operating system image (e.g., ubuntu-22.04)"
  default     = "ubuntu-22.04"
}

variable "location" {
  type        = string
  description = "The datacenter location (e.g., nbg1, fsn1, hel1)"
  default     = "nbg1"
}

variable "ssh_key_name" {
  type        = string
  description = "The name for the uploaded SSH key inside Hetzner"
}

variable "public_key" {
  type        = string
  description = "The actual public SSH key string for root access"
}

variable "private_network_id" {
  type        = number
  description = "The ID of the private network to attach this server to"
}
