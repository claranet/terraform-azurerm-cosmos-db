output "id" {
  description = "The CosmosDB Account ID."
  value       = azurerm_cosmosdb_account.main.id
}

output "name" {
  description = "The CosmosDB Account Name."
  value       = azurerm_cosmosdb_account.main.name
}

output "endpoint" {
  description = "The endpoint used to connect to the CosmosDB account."
  value       = azurerm_cosmosdb_account.main.endpoint
}

output "read_endpoints" {
  description = "A list of read endpoints available for this CosmosDB account."
  value       = azurerm_cosmosdb_account.main.read_endpoints
}

output "write_endpoints" {
  description = "A list of write endpoints available for this CosmosDB account."
  value       = azurerm_cosmosdb_account.main.write_endpoints
}

output "primary_master_key" {
  description = "The Primary master key for the CosmosDB Account."
  value       = azurerm_cosmosdb_account.main.primary_key
  sensitive   = true
}

output "secondary_master_key" {
  description = " The Secondary master key for the CosmosDB Account."
  value       = azurerm_cosmosdb_account.main.secondary_key
  sensitive   = true
}

output "primary_readonly_master_key" {
  description = "The Primary read-only master Key for the CosmosDB Account."
  value       = azurerm_cosmosdb_account.main.primary_readonly_key
  sensitive   = true
}

output "secondary_readonly_master_key" {
  description = "The Secondary read-only master key for the CosmosDB Account."
  value       = azurerm_cosmosdb_account.main.secondary_readonly_key
  sensitive   = true
}

output "identity_principal_id" {
  description = "CosmosDB account system identity principal ID."
  value       = try(azurerm_cosmosdb_account.main.identity[0].principal_id, null)
}

output "module_diagnostics" {
  description = "Diagnostics settings module outputs."
  value       = module.diagnostics
}

output "resource" {
  description = "CosmosDB resource object."
  value       = azurerm_cosmosdb_account.main
}
