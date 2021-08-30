module "logging" {
  source  = "claranet/diagnostic-settings/azurerm"
  version = "4.0.2"

  resource_id = azurerm_cosmosdb_account.db.id

  logs_destinations_ids = var.logs_destinations_ids
}
