resource "azurerm_cosmosdb_account" "db" {
  name                = var.custom_name == "" ? "cosmodb-${var.environment}-${var.azure_region_short}-${var.stack}" : var.custom_name
  location            = var.location
  resource_group_name = var.rg_name
  offer_type          = "Standard"
  kind                = var.kind

  enable_automatic_failover = true

  consistency_policy {
    consistency_level       = "BoundedStaleness"
    max_interval_in_seconds = 10
    max_staleness_prefix    = 200
  }

  geo_location {
    location          = var.failover_location
    failover_priority = 0
  }

  dynamic "capabilities" {
    for_each = toset(var.capabilities)
    content {
      name = capabilities.key
    }
  }

  ip_range_filter = join(",", concat(var.authorized_ips, module.common_variables.cosmos_portal_ips))

  tags = merge(
    var.custom_tags,
    module.tags.asset_custom_tags,
    {
      dd_azure_cosmosdb = "enabled"
      name              = "${var.stack}-${var.azure_region_short}-${var.environment}-cosmos"
      DeploymentDate    = var.deploymentdate
    }
  )
}
