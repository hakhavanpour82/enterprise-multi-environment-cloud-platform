variable "network_name" {
  type        = string
  description = "The name of the Hetzner private network"
}

variable "ip_range" {
  type        = string
  description = "The overall IP range for the private network (e.g., 10.0.0.0/16)"
}

variable "subnet_ip_range" {
  type        = string
  description = "The specific IP range for the subnet (e.g., 10.0.1.0/24)"
}

variable "network_zone" {
  type        = string
  description = "The zone where the network is located"
  default     = "eu-central"
}

