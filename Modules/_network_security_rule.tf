resource "azurerm_network_security_rule" "web_to_sql" {
    name = "WEB_Servers_to_sql"
    priority = var.security_rule_base_priority + 2
    direction = "Inbound"
    access = "Allow"
    protocol = "TCP"
    source_port_range = "*"
    destination_port_ranges = [ "445". "22", "1433", "8889"]
    source_application_security_group_ids = [azurerm_application_security_group.webasg1.id]
    destination_application_security_group_ids = [azurerm_application_security_group.sqlasg1.id]
    resource_group_name = var.primary_networking_resource_group_name
    network_security_group_name = var.primary_nsg_name
}

resource "azurerm_network_security_rule" "sql_to_web" {
    name = "SQL_Servers_to_web"
    priority = var.security_rule_base_priority + 2
    direction = "Inbound"
    access = "Allow"
    protocol = "TCP"
    source_port_range = "*"
    destination_port_ranges = [ "445". "22", "8889"]
    source_application_security_group_ids = [azurerm_application_security_group.webasg1.id]
    destination_application_security_group_ids = [azurerm_application_security_group.sqlasg1.id]
    resource_group_name = var.primary_networking_resource_group_name
    network_security_group_name = var.primary_nsg_name
}
