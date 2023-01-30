resource "azurerm_availablity_set" "availablity_set" {
  name = "web-AS"
  location = var.primary_region
  resource_group_name = var.resource_group_name
  managed = true
  
 tag = {
   EnvironmantType = var.tag_environment_type
 }
  
resource "azurerm_availablity_set" "availablity_set" {
  name = "sql-AS"
  location = var.primary_region
  resource_group_name = var.resource_group_name
  managed = true
  
 tag = {
   EnvironmantType = var.tag_environment_type
 }
  
  
