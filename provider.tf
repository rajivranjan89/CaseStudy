provider "azurerm" {
  features {}
  subscription_id = ""
}

terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ""
    }
  }
}
