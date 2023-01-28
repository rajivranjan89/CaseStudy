resource   "azurerm_virtual_network"   "myvnet"   { 
   name   =   "my-vnet" 
   address_space   =   [ "10.0.0.0/16" ] 
   location   =   var.primary_region  
   resource_group_name   =   var.resource_group_name
 } 

 resource   "azurerm_subnet"   "subnet1"   { 
   name   =   "testSubnet" 
   resource_group_name   =    var.resource_group_name 
   virtual_network_name   =   azurerm_virtual_network.myvnet.name 
   address_prefix   =   "10.0.1.0/22" 
 } 

 resource   "azurerm_public_ip"   "publicip1"   { 
   name   =   "testpublicip1"
   location   =   var.primary_region 
   resource_group_name   =   var.resource_group_name
   allocation_method   =   "Dynamic" 
   sku   =   "Basic" 
 } 

 resource   "azurerm_network_interface"   "myvm1nic"   { 
   name   =    "${var.nicname}${count.index + 1 }"
   location   =   var.primary_region 
   resource_group_name   =   var.resource_group_name
 
    ip_configuration   { 
     name   =   "ipconfig1" 
     subnet_id   =   azurerm_subnet.testSubnet.id 
     private_ip_address_allocation   =   "Dynamic" 
     public_ip_address_id   =   azurerm_public_ip.testpublicip1.id 
   } 
 }



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
   resource_group_name     =   var.resource_group_name
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
   resource_group_name     =   var.resource_group_name
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



