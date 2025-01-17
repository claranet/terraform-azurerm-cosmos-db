terraform {
  required_version = "~> 1.1"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.93"
    }
    azurecaf = {
      source  = "claranet/azurecaf"
      version = "~> 1.2, >= 1.2.22"
    }
  }
}
