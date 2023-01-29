module "vm"
  {
    source = "/Modules/azurerm"
    version = "0.0.1"
    resource_group_name = azurerm_resource_group.rg1.name
    subnet_id = local.subnet_id
    nsg_id = local.nsg_id
    nsg_name = local.nsg_name
    security_rule_base_priority = 1001
    tag_enironment_type = var.tag_environment_type
    vm_os_disk_size = "128"
    domain_user = var.domain_user
    domain_password = var.domain_password
    sku = "Standard"
    
    web_vm = {
      count = var.web_vm_count
      hostname = "WEBVM"
      vm_size = var.web_vm_size
    }
    
    sql_vms = {
      count = var.sql_vm_count
      hostname = "SQLVM"
      vm_size = var.sql_vm_size
      
    }
    
  }
    
