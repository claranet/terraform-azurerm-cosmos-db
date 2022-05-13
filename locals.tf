locals {
  default_failover_locations = {
    default = {
      location       = var.location
      zone_redundant = var.zone_redundancy_enabled
    }
  }
}
