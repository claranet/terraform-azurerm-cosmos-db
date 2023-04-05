module "azure_region" {
  source  = "claranet/regions/azurerm"
  version = "x.x.x"

  azure_region = var.azure_region
}

module "rg" {
  source  = "claranet/rg/azurerm"
  version = "x.x.x"

  location    = module.azure_region.location
  client_name = var.client_name
  environment = var.environment
  stack       = var.stack
}

module "logs" {
  source  = "claranet/run/azurerm//modules/logs"
  version = "x.x.x"

  client_name         = var.client_name
  environment         = var.environment
  stack               = var.stack
  location            = module.azure_region.location
  location_short      = module.azure_region.location_short
  resource_group_name = module.rg.resource_group_name
}

module "cosmosdb" {
  source  = "claranet/cosmos-db/azurerm"
  version = "x.x.x"

  environment    = var.environment
  location       = module.azure_region.location
  location_short = module.azure_region.location_short
  client_name    = var.client_name
  stack          = var.stack

  resource_group_name = module.rg.resource_group_name

  kind                 = "MongoDB"
  mongo_server_version = "4.0"

  capabilities = [
    "EnableMongo",
    "EnableAggregationPipeline",
    "mongoEnableDocLevelTTL",
  ]

  logs_destinations_ids = [module.logs.log_analytics_workspace_id]

  backup = {
    type                = "Periodic"
    interval_in_minutes = 60 * 3 # 3 hours
    retention_in_hours  = 24
  }

  extra_tags = {
    managed_by            = "Terraform"
    foo                   = "bar"
    monitor_autoscale_max = 2
  }
}
