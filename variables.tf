variable "name" {
  description = "Name prefix applied to every resource in the VPC."
  type        = string
}

variable "cidr_block" {
  description = "CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/16"

  validation {
    condition     = can(cidrhost(var.cidr_block, 0))
    error_message = "cidr_block must be a valid IPv4 CIDR, for example 10.0.0.0/16."
  }
}

variable "azs" {
  description = "Availability Zones to spread subnets across, in order."
  type        = list(string)
}

variable "public_subnet_cidrs" {
  description = "Web tier: one public subnet per CIDR, matched to azs by position."
  type        = list(string)
}

variable "app_subnet_cidrs" {
  description = "App tier: one private subnet per CIDR, matched to azs by position."
  type        = list(string)
}

variable "db_subnet_cidrs" {
  description = "Data tier: one isolated subnet per CIDR (no route to the internet)."
  type        = list(string)
}

variable "enable_nat_gateway" {
  description = "Create a single NAT Gateway so the app tier has outbound internet. Bills hourly, so it is off by default."
  type        = bool
  default     = false
}

variable "tags" {
  description = "Extra tags merged onto every resource."
  type        = map(string)
  default     = {}
}
