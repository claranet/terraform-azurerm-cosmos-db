output "name" {
  value = azurerm_cosmosdb_account.db.name
}

output "endpoint" {
  value = azurerm_cosmosdb_account.db.endpoint
}

output "read_endpoints" {
  value = azurerm_cosmosdb_account.db.read_endpoints
}

output "write_endpoints" {
  value = azurerm_cosmosdb_account.db.write_endpoints
}

output "primary_master_key" {
  value = azurerm_cosmosdb_account.db.primary_master_key
}

output "secondary_master_key" {
  value = azurerm_cosmosdb_account.db.secondary_master_key
}

output "primary_readonly_master_key" {
  value = azurerm_cosmosdb_account.db.primary_readonly_master_key
}

output "secondary_readonly_master_key" {
  value = azurerm_cosmosdb_account.db.secondary_readonly_master_key
}

output "connection_strings" {
  value = azurerm_cosmosdb_account.db.primary_readonly_master_key
}
