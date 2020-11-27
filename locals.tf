locals {
  name_prefix = var.name_prefix != "" ? replace(var.name_prefix, "/[a-z0-9]$/", "$0-") : ""

  default_name_server = "${local.name_prefix}${var.stack}-${var.client_name}-${var.location_short}-${var.environment}-cosmosdb"

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
