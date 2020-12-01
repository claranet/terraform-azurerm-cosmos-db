module "logging" {
  count = var.logs_destinations_ids != [] ? 1 : 0

  source  = "claranet/diagnostic-settings/azurerm"
  version = "4.0.0"

  resource_id = azurerm_cosmosdb_account.db.id

  logs_destinations_ids = var.logs_destinations_ids
}
