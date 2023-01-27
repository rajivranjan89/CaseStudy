/*** WEB ***/

resource "azurerm_application_gateway_security_group" "webasg1"
  name = "testwebasg"
  resource_group_name = var.resource_group_name
  location = var.primary_region

  tag = {
    EnvironmentType = var.tag_environment_type
  }
}

resource "azurerm_network_interface_application_security_group_association" "webasg1" {
  count = module.web_vms.vm_count
  network_interface_id = element(module.web_vms.nic_ids, count.index)
  applicatioon_security_group_id = azurerm_application-security_group.web_asg.id
    }
    
    
 
/*** SQL ***/

resource "azurerm_application_gateway_security_group" "sqlasg1"
  name = "testsqlasg"
  resource_group_name = var.resource_group_name
  location = var.primary_region

  tag = {
    EnvironmentType = var.tag_environment_type
  }
}

resource "azurerm_network_interface_application_security_group_association" "sqlasg1" {
  count = module.sql_vms.vm_count
  network_interface_id = element(module.sql_vms.nic_ids, count.index)
  applicatioon_security_group_id = azurerm_application-security_group.sql_asg.id
    }


  
