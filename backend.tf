terraform {
  required_version = "1.0.11" 
  
  backend "azurerm" {
    container_name       = "tf-state"
    key                  = "Prod/AzureNetwork/terraform.tfstate"
    resource_group_name  = "rg1"
    snapshot             = true
    storage_account_name = "rsgprdtfstate"
    subscription_id      = ""
  }
}
