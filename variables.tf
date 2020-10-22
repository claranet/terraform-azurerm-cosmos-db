variable "location" {}

variable "rg_name" {}

variable "stack" {}

variable "azure_region_short" {}

variable "environment" {}

variable "failover_location" {}

variable "custom_tags" {
  type    = map(string)
  default = {}
}

variable "custom_name" {
  default = ""
}

variable "kind" {
  default = "GlobalDocumentDB"
}

variable "authorized_ips" {
  type = list(string)
}

variable "creation_date" {}

variable "deploymentdate" {}

variable "countries" {}

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
  default = ""
}

variable "log_analytics_workspace_id" {
  type    = string
  default = null
}

variable "capabilities" {
  type    = list(string)
  default = []
}
