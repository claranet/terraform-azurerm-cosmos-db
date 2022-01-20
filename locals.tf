locals {
  default_tags = {
    env   = var.environment
    stack = var.stack
  }

  default_failover_locations = {
    default = {
      location = var.location
    }
  }
}
