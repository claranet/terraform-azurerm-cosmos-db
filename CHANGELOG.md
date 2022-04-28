# v6.0.0 - Unreleased

Breaking
  * AZ-717: Update to AzureRM provider v3

# v5.1.0 - 2022-04-04

Added
  * AZ-716: Add `mongo_server_version` parameter option
  * AZ-716: Add more new parameters for `analytical_storage`, require provider `v2.87` minimum version

# v5.0.0 - 2022-02-03

Breaking
  * AZ-515: Option to use Azure CAF naming provider to name resources

Added
  * AZ-615: Add an option to enable or disable default tags

Changed
  * AZ-572: Revamp examples and improve CI

Fixed
  * AZ-589: Avoid plan drift when specifying Diagnostic Settings categories

# v4.1.2 - 2021-09-03

Fixed
  * AZ-532: Fix variables description and README

# v4.1.1 - 2021-08-30

Changed
  * AZ-532: Revamp README with latest `terraform-docs` tool

# v4.1.0 - 2021-06-11

Added
  * [GITHUB-2](https://github.com/claranet/terraform-azurerm-cosmos-db/pull/2): Backup option

# v4.0.1 - 2021-04-13

Fixed
  * AZ-480: Fix `cosmosdb_connection_strings` output

# v4.0.0 - 2020-12-03

Added
  * AZ-79: Enable diagnostics settings option

Breaking
  * AZ-273: Terraform 0.13+ required

# v3.0.0 - 2020-11-27

Added
  * AZ-79: Initial release for Azure CosmosDB
