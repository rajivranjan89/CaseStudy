resource "azurerm_resource_group" "rg1"
{
  name = "testRG"
  location = "WestUS"
  
  tags = {
    EnvironmentType = var.tag_environment_type
  }
}
