# module "diagnostic_settings" {
#   #source = "git::https://github.com/claranet/terraform-azurerm-diagnostic-settings.git"
#   source = "../diagnostic_settings"

#   target_resource_id = azurerm_cosmosdb_account.db.id

#   enable_diag_settings = var.enable_diag_settings
#   logs                 = local.cosmosdb_logs

#   log_analytics_workspace_id = var.log_analytics_workspace_id

#   eventhub_namespace_name = var.eventhub_namespace_name
#   eventhub_namespace_rg   = var.eventhub_namespace_rg

#   eventhub_name = var.eventhub_name
# }
