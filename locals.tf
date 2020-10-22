locals {
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
