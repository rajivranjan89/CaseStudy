resource "random_string" "password" {
  length = 16
  special = true
  min_special = 2
  override_special = "/@\\"
}


resource   "azurerm_windows_virtual_machine"   "webvm"   { 
  count                    =   var.vm_count
   name                    =   "${var.hostname}${count.index + 1 }"
   location                =   var.primary_region 
   resource_group_name     =   azurerm_resource_group.rg.name 
   network_interface_ids   =   [ azurerm_network_interface.myvm 1 nic.id ] 
   size                    =   var.vm_size
   admin_username          =   var.vm_default_admin_username
   admin_password          =   random_string.password.result

   source_image_reference   { 
     publisher   =   var.vm_publisher
     offer       =   var.vm_offer
     sku         =   var.vm_sku 
     version     =   var.vm_version 
   } 

   os_disk   { 
     caching             =   var.vm_storage_os_disk_caching
     storage_account_type   =   var.managed_disk_type
   }
  
  tags = {
    EnvironmentType = var.tag_environment_type
  }
 }

resource   "azurerm_windows_virtual_machine"   "sqlvm"   { 
  count                    =   var.vm_count 
  name                    =   "${var.hostname}${count.index + 1 }"
   location                =   var.primary_region 
   resource_group_name     =   azurerm_resource_group.rg.name 
   network_interface_ids   =   [element(azurerm_network_interface.*.id,count.index,)] 
   size                    =   var.vm_size
   admin_username          =   var.vm_default_admin_username
   admin_password          =   random_string.password.result

   source_image_reference   { 
     publisher   =   var.vm_publisher
     offer       =   var.vm_offer
     sku         =   var.vm_sku 
     version     =   var.vm_version 
   } 

   os_disk   { 
     caching             =   var.vm_storage_os_disk_caching
     storage_account_type   =   var.managed_disk_type
   }
  
  tags = {
    EnvironmentType = var.tag_environment_type
  }
 } 



