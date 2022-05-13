output "cosmosdb_id" {
  description = "The CosmosDB Account ID."
  value       = azurerm_cosmosdb_account.db.id
}

output "cosmosdb_name" {
  description = "The CosmosDB Account Name."
  value       = azurerm_cosmosdb_account.db.name
}

output "cosmosdb_endpoint" {
  description = "The endpoint used to connect to the CosmosDB account."
  value       = azurerm_cosmosdb_account.db.endpoint
}

output "cosmosdb_read_endpoints" {
  description = "A list of read endpoints available for this CosmosDB account."
  value       = azurerm_cosmosdb_account.db.read_endpoints
}

output "cosmosdb_write_endpoints" {
  description = "A list of write endpoints available for this CosmosDB account."
  value       = azurerm_cosmosdb_account.db.write_endpoints
}

output "cosmosdb_primary_master_key" {
  description = "The Primary master key for the CosmosDB Account."
  value       = azurerm_cosmosdb_account.db.primary_key
  sensitive   = true
}

output "cosmosdb_secondary_master_key" {
  description = " The Secondary master key for the CosmosDB Account."
  value       = azurerm_cosmosdb_account.db.secondary_key
  sensitive   = true
}

output "cosmosdb_primary_readonly_master_key" {
  description = "The Primary read-only master Key for the CosmosDB Account."
  value       = azurerm_cosmosdb_account.db.primary_readonly_key
  sensitive   = true
}

output "cosmosdb_secondary_readonly_master_key" {
  description = "The Secondary read-only master key for the CosmosDB Account."
  value       = azurerm_cosmosdb_account.db.secondary_readonly_key
  sensitive   = true
}

output "cosmosdb_connection_strings" {
  description = "A list of connection strings available for this CosmosDB account."
  value       = azurerm_cosmosdb_account.db.connection_strings
  sensitive   = true
}

output "identity" {
  description = "Identity block with principal ID"
  value       = azurerm_cosmosdb_account.db.identity
}
