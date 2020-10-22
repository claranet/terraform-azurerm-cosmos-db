variable "client_name" {
  description = "Name of client"
  type        = string
}

variable "environment" {
  description = "Name of application's environnement"
  type        = string
}

variable "stack" {
  description = "Name of application stack"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the application ressource group, herited from infra module"
  type        = string
}

variable "location" {
  description = "Azure location for Key Vault."
  type        = string
}

variable "location_short" {
  description = "Short string for Azure location."
  type        = string
}

variable "name_prefix" {
  description = "Optional prefix for PostgreSQL server name"
  type        = string
  default     = ""
}

variable "custom_server_name" {
  type        = string
  description = "Custom Server Name identifier"
  default     = ""
}

variable "extra_tags" {
  type        = map(string)
  description = "Map of custom tags"
  default     = {}
}

## Specific CosmosDB parameters

variable "offer_type" {
  type        = string
  description = "Specifies the Offer Type to use for this CosmosDB Account - currently this can only be set to Standard."
  default     = "Standard"
}

variable "kind" {
  type        = string
  description = "Specifies the Kind of CosmosDB to create - possible values are `GlobalDocumentDB` and `MongoDB`."
  default     = "GlobalDocumentDB"
}

variable "failover_locations" {
  type        = map(map(string))
  description = "The name of the Azure region to host replicated data and their priority ()"
  default     = {}
}

variable "capabilities" {
  type        = list(string)
  description = <<EOD
Configures the capabilities to enable for this Cosmos DB account:
Possible values are
  AllowSelfServeUpgradeToMongo36, DisableRateLimitingResponses,
  EnableAggregationPipeline, EnableCassandra, EnableGremlin,EnableMongo, EnableTable, EnableServerless,
  MongoDBv3.4 and mongoEnableDocLevelTTL.
EOD
  default     = []
}

variable "ip_range_filter" {
  type        = list(string)
  description = "CosmosDB Firewall Support: This value specifies the set of IP addresses or IP address ranges in CIDR form to be included as the allowed list of client IP's for a given database account."
  default     = []
}

## Diagnostics options

variable "enable_diag_settings" {
  default = false
}

variable "eventhub_namespace_name" {
  type    = string
  default = null
}

variable "eventhub_namespace_rg" {
  type    = string
  default = null
}

variable "eventhub_name" {
  type    = string
  default = null
}

variable "log_analytics_workspace_id" {
  type    = string
  default = null
}
