module "vm"
  {
    source = ""
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
    
