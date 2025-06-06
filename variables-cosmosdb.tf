## Specific CosmosDB parameters

variable "offer_type" {
  description = "Specifies the Offer Type to use for this CosmosDB Account - currently this can only be set to Standard."
  type        = string
  default     = "Standard"
}

variable "kind" {
  description = "Specifies the Kind of CosmosDB to create - possible values are `GlobalDocumentDB` and `MongoDB`."
  type        = string
  default     = "GlobalDocumentDB"
}

variable "mongo_server_version" {
  description = "The Server Version of a MongoDB account. See [possible values](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cosmosdb_account#mongo_server_version)."
  type        = string
  default     = "7.0"
}

variable "zone_redundancy_enabled" {
  description = "True to enabled zone redundancy on default primary location."
  type        = bool
  default     = true
}

variable "failover_locations" {
  description = "The name of the Azure region to host replicated data and their priority."
  type        = map(map(string))
  default     = null
}

variable "capabilities" {
  description = <<EOD
Configures the capabilities to enable for this Cosmos DB account:
Possible values are
  AllowSelfServeUpgradeToMongo36, DisableRateLimitingResponses,
  EnableAggregationPipeline, EnableCassandra, EnableGremlin,EnableMongo, EnableTable, EnableServerless,
  MongoDBv3.4 and mongoEnableDocLevelTTL.
EOD
  type        = list(string)
  default     = []
}

variable "burst_capacity_enabled" {
  description = "Enable burst capacity for this Cosmos DB account."
  type        = bool
  default     = false
}

variable "allowed_cidrs" {
  description = "CosmosDB Firewall Support: This value specifies the set of IP addresses or IP address ranges in CIDR form to be included as the allowed list of client IP's for a given database account."
  type        = list(string)
  default     = []
}

variable "public_network_access_enabled" {
  description = "Whether or not public network access is allowed for this CosmosDB account."
  type        = bool
  default     = false
}

variable "is_virtual_network_filter_enabled" {
  description = "Enables virtual network filtering for this Cosmos DB account."
  type        = bool
  default     = false
}

variable "network_acl_bypass_for_azure_services_enabled" {
  description = "Whether to allow azure services to bypass ACLs."
  type        = bool
  default     = false
}

variable "network_acl_bypass_ids" {
  description = "The list of resource Ids for Network Acl Bypass for this Cosmos DB account."
  type        = list(string)
  default     = null
}

variable "virtual_network_rule" {
  description = "Specifies a `virtual_network_rules` resource used to define which subnets are allowed to access this CosmosDB account."
  type = list(object({
    id                                   = string
    ignore_missing_vnet_service_endpoint = bool
  }))
  default = null
}

variable "consistency_policy_level" {
  description = "Consistency policy level. Allowed values are `BoundedStaleness`, `Eventual`, `Session`, `Strong` or `ConsistentPrefix`."
  type        = string
  default     = "BoundedStaleness"
}

variable "consistency_policy_max_interval_in_seconds" {
  description = "When used with the Bounded Staleness consistency level, this value represents the time amount of staleness (in seconds) tolerated. Accepted range for this value is 5 - 86400 (1 day). Defaults to 10. Required when consistency_level is set to BoundedStaleness."
  type        = number
  default     = 10
}

variable "consistency_policy_max_staleness_prefix" {
  description = "When used with the Bounded Staleness consistency level, this value represents the number of stale requests tolerated. Accepted range for this value is 10 – 2147483647. Defaults to 200. Required when `consistency_level` is set to `BoundedStaleness`."
  type        = number
  default     = 200
}

variable "backup" {
  description = "Backup block with `type` (`Continuous` or `Periodic`), `tier` (`Continuous7Days` or `Continuous30Days`), `interval_in_minutes`, `retention_in_hours` and `storage_redundancy`."
  type = object({
    type                = string
    tier                = optional(string)
    interval_in_minutes = optional(number)
    retention_in_hours  = optional(number)
    storage_redundancy  = optional(string)
  })
  default = {
    type                = "Periodic"
    interval_in_minutes = 3 * 60
    retention_in_hours  = 7 * 24
    storage_redundancy  = "Geo"
  }
}

variable "analytical_storage_enabled" {
  description = "Enable Analytical Storage option for this Cosmos DB account. Defaults to `false`. Changing this forces a new resource to be created."
  type        = bool
  default     = false
}

variable "analytical_storage_type" {
  description = "The schema type of the Analytical Storage for this Cosmos DB account. Possible values are `FullFidelity` and `WellDefined`."
  type        = string
  default     = null

  validation {
    condition     = try(contains(["FullFidelity", "WellDefined"], var.analytical_storage_type), true)
    error_message = "The `analytical_storage_type` value must be valid. Possible values are `FullFidelity` and `WellDefined`."
  }
}

variable "identity_type" {
  description = "CosmosDB identity type. Possible values for type are: `null`, `SystemAssigned`, `SystemAssigned, UserAssigned`."
  type        = string
  default     = "SystemAssigned"
}

variable "identity_ids" {
  description = "User Assigned Identities IDs to add to this resource. Mandatory if `var.identity_type` contains `UserAssigned`."
  type        = list(string)
  default     = null
}

variable "free_tier_enabled" {
  description = "Enable the option to opt-in for the free database account within subscription."
  type        = bool
  default     = false
}

variable "access_key_metadata_writes_enabled" {
  description = "Is write operations on metadata resources (databases, containers, throughput) via account keys enabled?"
  type        = bool
  default     = true
}
