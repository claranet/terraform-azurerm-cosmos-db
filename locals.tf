locals {
  name_prefix = var.name_prefix != "" ? replace(var.name_prefix, "/[a-z0-9]$/", "$0-") : ""

  default_name_server = "${local.name_prefix}${var.stack}-${var.client_name}-${var.location_short}-${var.environment}-cosmosdb"

  default_tags = {
    env   = var.environment
    stack = var.stack
  }

  cosmosdb_logs = {
    DataPlaneRequests = {
      enabled        = false
      retention_days = 7
    },
    MongoRequests = {
      enabled        = true
      retention_days = 7
    },
    QueryRuntimeStatistics = {
      enabled        = false
      retention_days = 7
    },
    PartitionKeyStatistics = {
      enabled        = false
      retention_days = 7
    },
    PartitionKeyRUConsumption = {
      enabled        = false
      retention_days = 7
    },
    ControlPlaneRequests = {
      enabled        = false
      retention_days = 7
    },
    CassandraRequests = {
      enabled        = false
      retention_days = 7
    }
  }
}
