resource "azurerm_cosmosdb_account" "db" {
  name = coalesce(
    var.custom_server_name,
    local.default_name_server,
  )

  location            = var.location
  resource_group_name = var.resource_group_name

  offer_type = var.offer_type
  kind       = var.kind

  enable_automatic_failover = true

  dynamic "geo_location" {
    for_each = var.failover_locations
    content {
      prefix            = geo_location.key
      location          = geo_location.value.location
      failover_priority = lookup(geo_location.value, "priority", 0)
      zone_redundant    = lookup(geo_location.value, "zone_redundant", false)
    }
  }

  consistency_policy {
    consistency_level       = "BoundedStaleness"
    max_interval_in_seconds = 10
    max_staleness_prefix    = 200
  }

  dynamic "capabilities" {
    for_each = toset(var.capabilities)
    content {
      name = capabilities.key
    }
  }

  ip_range_filter = join(",", var.ip_range_filter)

  tags = merge(local.default_tags, var.extra_tags)
}
