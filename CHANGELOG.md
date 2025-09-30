## 8.2.1 (2025-09-30)

### Code Refactoring

* **deps:** 🔗 update claranet/azurecaf to ~> 1.3.0 🔧 4044928

### Miscellaneous Chores

* **⚙️:** ✏️ update template identifier for MR review 59ba0ae
* 🗑️ remove old commitlint configuration files 6450949
* **deps:** 🔗 bump AzureRM provider version to v4.31+ 3ea7fac
* **deps:** update dependency claranet/diagnostic-settings/azurerm to ~> 8.1.0 8765c94
* **deps:** update dependency opentofu to v1.10.0 ce528fd
* **deps:** update dependency opentofu to v1.10.1 c940185
* **deps:** update dependency opentofu to v1.10.3 91cda85
* **deps:** update dependency opentofu to v1.10.6 f4f6549
* **deps:** update dependency tflint to v0.58.0 8007157
* **deps:** update dependency tflint to v0.58.1 d215b06
* **deps:** update dependency tflint to v0.59.1 57307c0
* **deps:** update dependency trivy to v0.63.0 a091e6f
* **deps:** update dependency trivy to v0.66.0 8bc1db2
* **deps:** update dependency trivy to v0.67.0 15b15c4
* **deps:** update pre-commit hook pre-commit/pre-commit-hooks to v6 b6bb513
* **deps:** update pre-commit hook tofuutils/pre-commit-opentofu to v2.2.1 cc35554
* **deps:** update terraform claranet/diagnostic-settings/azurerm to ~> 8.2.0 c741aa2
* **deps:** update tools 44e7bf5
* **deps:** update tools 1e000c5
* **deps:** update tools a328c05

## 8.2.0 (2025-05-16)

### Features

* **AZ-1553:** ✨ add access_key_metadata_writes_enabled parameter 84ffb1f

### Miscellaneous Chores

* **deps:** update dependency trivy to v0.62.1 33ec55d

## 8.1.0 (2025-05-05)

### Features

* **GH-7:** add burst capacity enabled variable 803814b

### Documentation

* **GH-7:** add burst capacity enabled variable documentation 5359be4

### Miscellaneous Chores

* **deps:** update dependency opentofu to v1.9.1 097c653
* **deps:** update dependency pre-commit to v4.2.0 591e24f
* **deps:** update dependency terraform-docs to v0.20.0 c1baa2d
* **deps:** update dependency tflint to v0.56.0 90e3a09
* **deps:** update dependency tflint to v0.57.0 068de51
* **deps:** update dependency trivy to v0.59.1 61ab177
* **deps:** update dependency trivy to v0.60.0 c584435
* **deps:** update dependency trivy to v0.61.0 f41f051
* **deps:** update dependency trivy to v0.61.1 2b787e4
* **deps:** update dependency trivy to v0.62.0 1a8dad1
* **deps:** update pre-commit hook alessandrojcm/commitlint-pre-commit-hook to v9.21.0 aac7db7
* **deps:** update pre-commit hook alessandrojcm/commitlint-pre-commit-hook to v9.22.0 145314f
* **deps:** update pre-commit hook tofuutils/pre-commit-opentofu to v2.2.0 27aad8e
* **deps:** update tools 2b4f0fd
* update Github templates 829e407

## 8.0.0 (2025-01-24)

### ⚠ BREAKING CHANGES

* **AZ-1088:** AzureRM Provider v4+ and OpenTofu 1.8+

### Features

* **AZ-1088:** module v8 structure and updates 5decac2

### Documentation

* **AZ-1088:** update examples 07af780

### Miscellaneous Chores

* apply suggestions 2a3d57b
* apply suggestions cc79cde
* **deps:** update dependency pre-commit to v4.1.0 cb4147e

## 7.0.0 (2025-01-17)

### ⚠ BREAKING CHANGES

* bump module to v7, minimum TF version 1.3+

### Features

* bump module to v7, minimum TF version 1.3+ 0e352a8

## 6.8.0 (2025-01-17)

### Features

* **AZ-1494:** add tier for continuous backup 7133a4c

### Miscellaneous Chores

* **deps:** update dependency opentofu to v1.8.3 e032409
* **deps:** update dependency opentofu to v1.8.4 0716914
* **deps:** update dependency opentofu to v1.8.6 7a43076
* **deps:** update dependency opentofu to v1.8.8 576a214
* **deps:** update dependency opentofu to v1.9.0 cfe0bff
* **deps:** update dependency pre-commit to v4 a4e90da
* **deps:** update dependency pre-commit to v4.0.1 7b61c91
* **deps:** update dependency tflint to v0.54.0 706d2b4
* **deps:** update dependency tflint to v0.55.0 c418262
* **deps:** update dependency trivy to v0.56.1 25aec00
* **deps:** update dependency trivy to v0.56.2 8fdd461
* **deps:** update dependency trivy to v0.57.1 1cf6c65
* **deps:** update dependency trivy to v0.58.1 be5ae74
* **deps:** update dependency trivy to v0.58.2 05f4388
* **deps:** update pre-commit hook alessandrojcm/commitlint-pre-commit-hook to v9.19.0 1d48a34
* **deps:** update pre-commit hook alessandrojcm/commitlint-pre-commit-hook to v9.20.0 709be16
* **deps:** update pre-commit hook pre-commit/pre-commit-hooks to v5 c328130
* **deps:** update pre-commit hook tofuutils/pre-commit-opentofu to v2.1.0 acab93d
* **deps:** update tools 52558fd
* **deps:** update tools cab6185
* prepare for new examples structure 3f18833
* update examples structure 7045ce6
* update tflint config for v0.55.0 6b7169b

## 6.7.0 (2024-10-03)

### Features

* use Claranet "azurecaf" provider 05ae79c

### Documentation

* update README badge to use OpenTofu registry c2a3401
* update README with `terraform-docs` v0.19.0 a5475e6

### Continuous Integration

* **AZ-1391:** enable semantic-release [skip ci] b07f78b
* **AZ-1391:** update semantic-release config [skip ci] 83f21f8

### Miscellaneous Chores

* **deps:** add renovate.json 26c1fd0
* **deps:** enable automerge on renovate e45c951
* **deps:** update dependency opentofu to v1.7.0 7c4ee3f
* **deps:** update dependency opentofu to v1.7.1 16cee5f
* **deps:** update dependency opentofu to v1.7.2 de06761
* **deps:** update dependency opentofu to v1.7.3 5e7ba40
* **deps:** update dependency opentofu to v1.8.0 e449049
* **deps:** update dependency opentofu to v1.8.1 3156a2f
* **deps:** update dependency opentofu to v1.8.2 1d05a72
* **deps:** update dependency pre-commit to v3.7.1 c7dadd4
* **deps:** update dependency pre-commit to v3.8.0 7ffa47c
* **deps:** update dependency terraform-docs to v0.18.0 0433df1
* **deps:** update dependency terraform-docs to v0.19.0 d117d8b
* **deps:** update dependency tflint to v0.51.0 07273a4
* **deps:** update dependency tflint to v0.51.1 4809638
* **deps:** update dependency tflint to v0.51.2 3f47e6e
* **deps:** update dependency tflint to v0.52.0 9268ec0
* **deps:** update dependency tflint to v0.53.0 c91ec27
* **deps:** update dependency trivy to v0.50.2 0e727a7
* **deps:** update dependency trivy to v0.50.4 426eddb
* **deps:** update dependency trivy to v0.51.0 81a31d2
* **deps:** update dependency trivy to v0.51.1 053bdde
* **deps:** update dependency trivy to v0.51.2 fb251cb
* **deps:** update dependency trivy to v0.51.3 04d40b2
* **deps:** update dependency trivy to v0.51.4 3370a88
* **deps:** update dependency trivy to v0.52.0 a7eb249
* **deps:** update dependency trivy to v0.52.1 a78dba8
* **deps:** update dependency trivy to v0.52.2 12a37d8
* **deps:** update dependency trivy to v0.53.0 c2749b2
* **deps:** update dependency trivy to v0.55.0 79aead5
* **deps:** update dependency trivy to v0.55.1 e45f285
* **deps:** update dependency trivy to v0.55.2 49c2c74
* **deps:** update dependency trivy to v0.56.0 985ce04
* **deps:** update pre-commit hook alessandrojcm/commitlint-pre-commit-hook to v9.17.0 b961932
* **deps:** update pre-commit hook alessandrojcm/commitlint-pre-commit-hook to v9.18.0 566eb04
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.92.0 5396ebf
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.92.2 64ca780
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.92.3 0ac1dc1
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.93.0 2ff8b5b
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.94.0 ec54fd0
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.94.1 ab4d34c
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.94.2 8ef8c2d
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.94.3 f3867f8
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.95.0 cb6aefd
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.96.0 7ef9a1e
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.96.1 1784937
* **deps:** update renovate.json 98123ea
* **deps:** update tools 7e53442
* **pre-commit:** update commitlint hook f899781
* **release:** remove legacy `VERSION` file 0b5bb3d

# v6.6.0 - 2024-03-01

Added
  * AZ-1350: Add `storage_redundancy` parameter to backup

# v6.5.0 - 2023-09-22

Breaking
  * AZ-1175: Remove `retention_days` parameters, it must be handled at destination level now. (for reference: [Provider issue](https://github.com/hashicorp/terraform-provider-azurerm/issues/23051))

# v6.4.0 - 2023-04-05

Added
  * [GH-5](https://github.com/claranet/terraform-azurerm-cosmos-db/pull/5): Add variable for free tier option

# v6.3.0 - 2023-02-10

Added
  * AZ-999: Add resource group name output

# v6.2.0 - 2022-11-23

Changed
  * AZ-908: Use the new data source for CAF naming (instead of resource)

# v6.1.0 - 2022-05-20

Added
  * AZ-740: Additional variables

Changed
  * AZ-740: System assigned identity configured by default
  * AZ-740: Zone redundancy enabled by default
  * AZ-739: Remove validation constraint on `mongo_server_version` variable and set default value to `4.2`

# v6.0.0 - 2022-05-11

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
