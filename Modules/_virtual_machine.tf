# Define a Virtual Network and Subnet
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
# Define a New Public IP Address

 resource   "azurerm_public_ip"   "publicip1"   { 
   name   =   "testpublicip1"
   location   =   var.primary_region 
   resource_group_name   =   var.resource_group_name
   allocation_method   =   "Dynamic" 
   sku   =   "Basic" 
 } 

resource   "azurerm_public_ip"   "publicip2"   { 
   name   =   "testpublicip2"
   location   =   var.primary_region 
   resource_group_name   =   var.resource_group_name
   allocation_method   =   "Dynamic" 
   sku   =   "Basic" 
 } 

# Define a Network Interface for our VM

 resource   "azurerm_network_interface"   "myvm1nic"   { 
   name   =    "${var.webnicname}${count.index + 1 }"
   location   =   var.primary_region 
   resource_group_name   =   var.resource_group_name
 
    ip_configuration   { 
     name   =   "ipconfig1" 
     subnet_id   =   azurerm_subnet.testSubnet.id 
     private_ip_address_allocation   =   "Dynamic" 
     public_ip_address_id   =   azurerm_public_ip.testpublicip1.id 
   } 
 }

resource   "azurerm_network_interface"   "myvm2nic"   { 
   name   =    "${var.sqlnicname}${count.index + 1 }"
   location   =   var.primary_region 
   resource_group_name   =   var.resource_group_name
 
    ip_configuration   { 
     name   =   "ipconfig2" 
     subnet_id   =   azurerm_subnet.testSubnet.id 
     private_ip_address_allocation   =   "Dynamic" 
     public_ip_address_id   =   azurerm_public_ip.testpublicip2.id 
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
   network_interface_ids   =   [ azurerm_network_interface.myvm1nic.id ] 
   size                    =   var.vm_size
   admin_username          =   var.vm_default_admin_username
   admin_password          =   random_string.password.result
     sku         =   var.vm_sku 
     

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
   network_interface_ids   =   [azurerm_network_interface.myvm2nic.id] 
   size                    =   var.vm_size
   admin_username          =   var.vm_default_admin_username
   admin_password          =   random_string.password.result
   sku         =   var.vm_sku 
    
   os_disk   { 
     caching             =   var.vm_storage_os_disk_caching
     storage_account_type   =   var.managed_disk_type
   }
  
  tags = {
    EnvironmentType = var.tag_environment_type
  }
 } 



