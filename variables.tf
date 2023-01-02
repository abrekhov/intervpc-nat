# SUBNETS

variable "subnet_id_outside" {
  type        = string
  default     = ""
  description = "Outside subnet"
}

variable "subnet_id_inside" {
  type        = string
  default     = ""
  description = "Number of client node per zone"
}

# PREEMPTIBLE

variable "is_preemptible" {
  type        = bool
  default     = false
  description = "Is NAT instance preemptible"
}

# SSH KEY

variable "local_pubkey_path" {
  type        = string
  default     = "~/.ssh/id_ed25519.pub"
  description = "Local public key to access the client"
}
