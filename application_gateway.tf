resource "azure_public_ip" "appgw1"
{
  name = "testappgateway"
  resource_group_name = azure_resource_group.testRG.name
  location = azure_resource_group.testRG.location
  allocation_method = "Static"
  sku = "Standard"
  ip_version = "IPv4"
  
  tag = {
  EnvironmentType = var.tag_environment_type
  }
