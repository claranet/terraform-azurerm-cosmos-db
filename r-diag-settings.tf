module "logging" {
  count = var.logs_destinations_ids != [] ? 1 : 0

  source = "git::ssh://git@git.fr.clara.net/claranet/projects/cloud/azure/terraform/modules/diagnostic-settings.git?ref=AZ-273_tf013"

  resource_id = azurerm_cosmosdb_account.db.id

  logs_destinations_ids = var.logs_destinations_ids
}
