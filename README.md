# Azure CosmosDB
[![Changelog](https://img.shields.io/badge/changelog-release-green.svg)](CHANGELOG.md) [![Notice](https://img.shields.io/badge/notice-copyright-yellow.svg)](NOTICE) [![Apache V2 License](https://img.shields.io/badge/license-Apache%20V2-orange.svg)](LICENSE) [![TF Registry](https://img.shields.io/badge/terraform-registry-blue.svg)](https://registry.terraform.io/modules/claranet/cosmos-db/azurerm/)

This terraform module creates an [Azure CosmosDB](https://docs.microsoft.com/en-us/azure/cosmos-db/introduction).
[Diagnostic settings](https://docs.microsoft.com/en-us/azure/diagnostics) are also deployed.

## Version compatibility

| Module version | Terraform version | AzureRM version |
|----------------|-------------------| --------------- |
| >= 4.x.x       | 0.13.x            | >= 2.0          |
| >= 3.x.x       | 0.12.x            | >= 2.0          |
| >= 2.x.x       | 0.12.x            | < 2.0           |
| <  2.x.x       | 0.11.x            | < 2.0           |

## Usage

This module is optimized to work with the [Claranet terraform-wrapper](https://github.com/claranet/terraform-wrapper) tool
which set some terraform variables in the environment needed by this module.
More details about variables set by the `terraform-wrapper` available in the [documentation](https://github.com/claranet/terraform-wrapper#environment).

```hcl
module "azure-region" {
  source  = "claranet/regions/azurerm"
  version = "x.x.x"

  azure_region = var.azure_region
}

module "rg" {
  source  = "claranet/rg/azurerm"
  version = "x.x.x"

  location    = module.azure-region.location
  client_name = var.client_name
  environment = var.environment
  stack       = var.stack
}

module "cosmosdb" {
  source  = "claranet/cosmos-db/azurerm"
  version = "x.x.x"

  environment    = var.environment
  location       = module.azure-region.location
  location_short = module.azure-region.location_short
  client_name    = var.client_name
  stack          = var.stack

  resource_group_name = module.rg.resource_group_name

  logs_destinations_ids = [module.run-common.log_analytics_workspace_id]

  extra_tags = {
    managed_by            = "Terraform"
    foo                   = "bar"
    monitor_autoscale_max = 2
  }
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| allowed\_cidrs | CosmosDB Firewall Support: This value specifies the set of IP addresses or IP address ranges in CIDR form to be included as the allowed list of client IP's for a given database account. | `list(string)` | `[]` | no |
| capabilities | Configures the capabilities to enable for this Cosmos DB account:<br>Possible values are<br>  AllowSelfServeUpgradeToMongo36, DisableRateLimitingResponses,<br>  EnableAggregationPipeline, EnableCassandra, EnableGremlin,EnableMongo, EnableTable, EnableServerless,<br>  MongoDBv3.4 and mongoEnableDocLevelTTL. | `list(string)` | `[]` | no |
| client\_name | Name of client | `string` | n/a | yes |
| consistency\_policy\_level | Consistency policy level. Allowed values are `BoundedStaleness`, `Eventual`, `Session`, `Strong` or `ConsistentPrefix` | `string` | `"BoundedStaleness"` | no |
| consistency\_policy\_max\_interval\_in\_seconds | When used with the Bounded Staleness consistency level, this value represents the time amount of staleness (in seconds) tolerated. Accepted range for this value is 5 - 86400 (1 day). Defaults to 5. Required when consistency\_level is set to BoundedStaleness. | `number` | `10` | no |
| consistency\_policy\_max\_staleness\_prefix | When used with the Bounded Staleness consistency level, this value represents the number of stale requests tolerated. Accepted range for this value is 10 – 2147483647. Defaults to 100. Required when consistency\_level is set to BoundedStaleness. | `number` | `200` | no |
| custom\_server\_name | Custom Server Name identifier | `string` | `""` | no |
| environment | Name of application's environnement | `string` | n/a | yes |
| extra\_tags | Map of custom tags | `map(string)` | `{}` | no |
| failover\_locations | The name of the Azure region to host replicated data and their priority. | `map(map(string))` | `null` | no |
| is\_virtual\_network\_filter\_enabled | Enables virtual network filtering for this Cosmos DB account | `bool` | `false` | no |
| kind | Specifies the Kind of CosmosDB to create - possible values are `GlobalDocumentDB` and `MongoDB`. | `string` | `"GlobalDocumentDB"` | no |
| location | Azure location for Key Vault. | `string` | n/a | yes |
| location\_short | Short string for Azure location. | `string` | n/a | yes |
| logs\_destinations\_ids | List of destination resources IDs for logs diagnostic destination. Can be Storage Account, Log Analytics Workspace and Event Hub. No more than one of each can be set. | `list(string)` | n/a | yes |
| name\_prefix | Optional prefix for PostgreSQL server name | `string` | `""` | no |
| offer\_type | Specifies the Offer Type to use for this CosmosDB Account - currently this can only be set to Standard. | `string` | `"Standard"` | no |
| resource\_group\_name | Name of the application ressource group, herited from infra module | `string` | n/a | yes |
| stack | Name of application stack | `string` | n/a | yes |
| virtual\_network\_rule | Specifues a virtual\_network\_rules resource used to define which subnets are allowed to access this CosmosDB account | <pre>list(object({<br>    id                                   = string,<br>    ignore_missing_vnet_service_endpoint = bool<br>  }))</pre> | `null` | no |
| backup | Backup block with type (Continuous / Periodic), interval_in_minutes and retention_in_hours keys| <pre>map({<br>    type                = string,<br>    retention_in_hours  = number,<br>    interval_in_minutes = number<br>  })</pre> | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| cosmosdb\_connection\_strings | A list of connection strings available for this CosmosDB account. |
| cosmosdb\_endpoint | The endpoint used to connect to the CosmosDB account. |
| cosmosdb\_id | The CosmosDB Account ID. |
| cosmosdb\_name | The CosmosDB Account Name. |
| cosmosdb\_primary\_master\_key | The Primary master key for the CosmosDB Account. |
| cosmosdb\_primary\_readonly\_master\_key | The Primary read-only master Key for the CosmosDB Account. |
| cosmosdb\_read\_endpoints | A list of read endpoints available for this CosmosDB account. |
| cosmosdb\_secondary\_master\_key | The Secondary master key for the CosmosDB Account. |
| cosmosdb\_secondary\_readonly\_master\_key | The Secondary read-only master key for the CosmosDB Account. |
| cosmosdb\_write\_endpoints | A list of write endpoints available for this CosmosDB account. |

## Related documentation

  * [Terraform resource documentation](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cosmosdb_account)
  * [Microsoft Azure documentation](https://docs.microsoft.com/en-us/azure/cosmos-db/introduction)
