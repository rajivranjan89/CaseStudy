resource "azurerm_availablity_set" "availablity_set" {
  name = "web-AS"
  location = var.primary_region
  resource_group_name = var.resource_group_name
  platform_update_domain_count = var.as_platform_update_domain_count
  platform_fault_domain_count = var.as_platform_fault_domain_count
  managed = true
  
 tag = {
   EnvironmantType = var.tag_environment_type
 }
  
resource "azurerm_availablity_set" "availablity_set" {
  name = "sql-AS"
  location = var.primary_region
  resource_group_name = var.resource_group_name
  platform_update_domain_count = var.as_platform_update_domain_count
  platform_fault_domain_count = var.as_platform_fault_domain_count
  managed = true
  
 tag = {
   EnvironmantType = var.tag_environment_type
 }
  
  
