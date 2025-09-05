# Azure CosmosDB
[![Changelog](https://img.shields.io/badge/changelog-release-green.svg)](CHANGELOG.md) [![Notice](https://img.shields.io/badge/notice-copyright-blue.svg)](NOTICE) [![Apache V2 License](https://img.shields.io/badge/license-Apache%20V2-orange.svg)](LICENSE) [![OpenTofu Registry](https://img.shields.io/badge/opentofu-registry-yellow.svg)](https://search.opentofu.org/module/claranet/cosmos-db/azurerm/)

This terraform module creates an [Azure CosmosDB](https://docs.microsoft.com/en-us/azure/cosmos-db/introduction).
[Diagnostic settings](https://docs.microsoft.com/en-us/azure/diagnostics) are also deployed.

<!-- BEGIN_TF_DOCS -->
## Global versioning rule for Claranet Azure modules

| Module version | Terraform version | OpenTofu version | AzureRM version |
| -------------- | ----------------- | ---------------- | --------------- |
| >= 8.x.x       | **Unverified**    | 1.8.x            | >= 4.0          |
| >= 7.x.x       | 1.3.x             |                  | >= 3.0          |
| >= 6.x.x       | 1.x               |                  | >= 3.0          |
| >= 5.x.x       | 0.15.x            |                  | >= 2.0          |
| >= 4.x.x       | 0.13.x / 0.14.x   |                  | >= 2.0          |
| >= 3.x.x       | 0.12.x            |                  | >= 2.0          |
| >= 2.x.x       | 0.12.x            |                  | < 2.0           |
| <  2.x.x       | 0.11.x            |                  | < 2.0           |

## Contributing

If you want to contribute to this repository, feel free to use our [pre-commit](https://pre-commit.com/) git hook configuration
which will help you automatically update and format some files for you by enforcing our Terraform code module best-practices.

More details are available in the [CONTRIBUTING.md](./CONTRIBUTING.md#pull-request-process) file.

## Usage

This module is optimized to work with the [Claranet terraform-wrapper](https://github.com/claranet/terraform-wrapper) tool
which set some terraform variables in the environment needed by this module.
More details about variables set by the `terraform-wrapper` available in the [documentation](https://github.com/claranet/terraform-wrapper#environment).

⚠️ Since modules version v8.0.0, we do not maintain/check anymore the compatibility with
[Hashicorp Terraform](https://github.com/hashicorp/terraform/). Instead, we recommend to use [OpenTofu](https://github.com/opentofu/opentofu/).

```hcl
module "cosmosdb" {
  source  = "claranet/cosmos-db/azurerm"
  version = "x.x.x"

  environment    = var.environment
  location       = module.azure_region.location
  location_short = module.azure_region.location_short
  client_name    = var.client_name
  stack          = var.stack

  resource_group_name = module.rg.name

  logs_destinations_ids = [
    module.run.logs_storage_account_id,
    module.run.log_analytics_workspace_id,
  ]

  backup = {
    type                = "Periodic"
    interval_in_minutes = 60 * 3 # 3 hours
    retention_in_hours  = 24
    storage_redundancy  = "Zone"
  }

  extra_tags = {
    managed_by            = "Terraform"
    foo                   = "bar"
    monitor_autoscale_max = 2
  }
}
```

## Providers

| Name | Version |
|------|---------|
| azurecaf | ~> 1.2.28 |
| azurerm | ~> 4.31 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| diagnostics | claranet/diagnostic-settings/azurerm | ~> 8.2.0 |

## Resources

| Name | Type |
|------|------|
| [azurerm_cosmosdb_account.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cosmosdb_account) | resource |
| [azurecaf_name.cosmosdb](https://registry.terraform.io/providers/claranet/azurecaf/latest/docs/data-sources/name) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| access\_key\_metadata\_writes\_enabled | Is write operations on metadata resources (databases, containers, throughput) via account keys enabled? | `bool` | `true` | no |
| allowed\_cidrs | CosmosDB Firewall Support: This value specifies the set of IP addresses or IP address ranges in CIDR form to be included as the allowed list of client IP's for a given database account. | `list(string)` | `[]` | no |
| analytical\_storage\_enabled | Enable Analytical Storage option for this Cosmos DB account. Defaults to `false`. Changing this forces a new resource to be created. | `bool` | `false` | no |
| analytical\_storage\_type | The schema type of the Analytical Storage for this Cosmos DB account. Possible values are `FullFidelity` and `WellDefined`. | `string` | `null` | no |
| backup | Backup block with `type` (`Continuous` or `Periodic`), `tier` (`Continuous7Days` or `Continuous30Days`), `interval_in_minutes`, `retention_in_hours` and `storage_redundancy`. | <pre>object({<br/>    type                = string<br/>    tier                = optional(string)<br/>    interval_in_minutes = optional(number)<br/>    retention_in_hours  = optional(number)<br/>    storage_redundancy  = optional(string)<br/>  })</pre> | <pre>{<br/>  "interval_in_minutes": 180,<br/>  "retention_in_hours": 168,<br/>  "storage_redundancy": "Geo",<br/>  "type": "Periodic"<br/>}</pre> | no |
| burst\_capacity\_enabled | Enable burst capacity for this Cosmos DB account. | `bool` | `false` | no |
| capabilities | Configures the capabilities to enable for this Cosmos DB account:<br/>Possible values are<br/>  AllowSelfServeUpgradeToMongo36, DisableRateLimitingResponses,<br/>  EnableAggregationPipeline, EnableCassandra, EnableGremlin,EnableMongo, EnableTable, EnableServerless,<br/>  MongoDBv3.4 and mongoEnableDocLevelTTL. | `list(string)` | `[]` | no |
| client\_name | Client name. | `string` | n/a | yes |
| consistency\_policy\_level | Consistency policy level. Allowed values are `BoundedStaleness`, `Eventual`, `Session`, `Strong` or `ConsistentPrefix`. | `string` | `"BoundedStaleness"` | no |
| consistency\_policy\_max\_interval\_in\_seconds | When used with the Bounded Staleness consistency level, this value represents the time amount of staleness (in seconds) tolerated. Accepted range for this value is 5 - 86400 (1 day). Defaults to 10. Required when consistency\_level is set to BoundedStaleness. | `number` | `10` | no |
| consistency\_policy\_max\_staleness\_prefix | When used with the Bounded Staleness consistency level, this value represents the number of stale requests tolerated. Accepted range for this value is 10 – 2147483647. Defaults to 200. Required when `consistency_level` is set to `BoundedStaleness`. | `number` | `200` | no |
| custom\_name | Custom CosmosDB Server Name identifier. | `string` | `""` | no |
| default\_tags\_enabled | Option to enable or disable default tags. | `bool` | `true` | no |
| diagnostic\_settings\_custom\_name | Custom name of the diagnostics settings, name will be `default` if not set. | `string` | `"default"` | no |
| environment | Environment name. | `string` | n/a | yes |
| extra\_tags | Map of custom tags. | `map(string)` | `{}` | no |
| failover\_locations | The name of the Azure region to host replicated data and their priority. | `map(map(string))` | `null` | no |
| free\_tier\_enabled | Enable the option to opt-in for the free database account within subscription. | `bool` | `false` | no |
| identity\_ids | User Assigned Identities IDs to add to this resource. Mandatory if `var.identity_type` contains `UserAssigned`. | `list(string)` | `null` | no |
| identity\_type | CosmosDB identity type. Possible values for type are: `null`, `SystemAssigned`, `SystemAssigned, UserAssigned`. | `string` | `"SystemAssigned"` | no |
| is\_virtual\_network\_filter\_enabled | Enables virtual network filtering for this Cosmos DB account. | `bool` | `false` | no |
| kind | Specifies the Kind of CosmosDB to create - possible values are `GlobalDocumentDB` and `MongoDB`. | `string` | `"GlobalDocumentDB"` | no |
| location | Azure location for CosmosDB. | `string` | n/a | yes |
| location\_short | Short string for Azure location. | `string` | n/a | yes |
| logs\_categories | Log categories to send to destinations. | `list(string)` | `null` | no |
| logs\_destinations\_ids | List of destination resources IDs for logs diagnostic destination.<br/>Can be `Storage Account`, `Log Analytics Workspace` and `Event Hub`. No more than one of each can be set.<br/>If you want to use Azure EventHub as a destination, you must provide a formatted string containing both the EventHub Namespace authorization send ID and the EventHub name (name of the queue to use in the Namespace) separated by the <code>&#124;</code> character. | `list(string)` | n/a | yes |
| logs\_metrics\_categories | Metrics categories to send to destinations. | `list(string)` | `null` | no |
| mongo\_server\_version | The Server Version of a MongoDB account. See [possible values](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cosmosdb_account#mongo_server_version). | `string` | `"7.0"` | no |
| name\_prefix | Optional prefix for the generated name. | `string` | `""` | no |
| name\_suffix | Optional suffix for the generated name. | `string` | `""` | no |
| network\_acl\_bypass\_for\_azure\_services\_enabled | Whether to allow azure services to bypass ACLs. | `bool` | `false` | no |
| network\_acl\_bypass\_ids | The list of resource Ids for Network Acl Bypass for this Cosmos DB account. | `list(string)` | `null` | no |
| offer\_type | Specifies the Offer Type to use for this CosmosDB Account - currently this can only be set to Standard. | `string` | `"Standard"` | no |
| public\_network\_access\_enabled | Whether or not public network access is allowed for this CosmosDB account. | `bool` | `false` | no |
| resource\_group\_name | Resource Group the resources will belong to. | `string` | n/a | yes |
| stack | Stack name. | `string` | n/a | yes |
| virtual\_network\_rule | Specifies a `virtual_network_rules` resource used to define which subnets are allowed to access this CosmosDB account. | <pre>list(object({<br/>    id                                   = string<br/>    ignore_missing_vnet_service_endpoint = bool<br/>  }))</pre> | `null` | no |
| zone\_redundancy\_enabled | True to enabled zone redundancy on default primary location. | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| endpoint | The endpoint used to connect to the CosmosDB account. |
| id | The CosmosDB account ID. |
| identity\_principal\_id | CosmosDB account system identity principal ID. |
| module\_diagnostics | Diagnostics settings module outputs. |
| name | The CosmosDB account name. |
| primary\_master\_key | The primary master key for the CosmosDB account. |
| primary\_readonly\_master\_key | The primary read-only master key for the CosmosDB account. |
| read\_endpoints | A list of read endpoints available for this CosmosDB account. |
| resource | CosmosDB resource object. |
| secondary\_master\_key | The secondary master key for the CosmosDB account. |
| secondary\_readonly\_master\_key | The secondary read-only master key for the CosmosDB account. |
| write\_endpoints | A list of write endpoints available for this CosmosDB account. |
<!-- END_TF_DOCS -->
## Related documentation

  * [Microsoft Azure documentation](https://docs.microsoft.com/en-us/azure/cosmos-db/introduction)
