variable "web_vms" {
  description = "attribute for web server"
  type = map(string)
  
  default = {
    count = 1
    hostname = ""
    vm_size = ""
    
  }
}
variable "sql_vms" {
  description = "attribute for web server"
  type = map(string)
  
  default = {
    count = 1
    hostname = ""
    vm_size = ""
    
  }
}

variable "resource_group_name" {
  description = "name of RG"
}

variable "primary_region" {
  description = "Name of Primary region"
}

variable "vm_default_admin_username" {
  description = "name of login user"
}

variable "vm_storage_os_disk_caching" {
}

variable "managed_disk_type" {
}

variable "ag_environment_type" {
}

variable "security_rule_base_priority " {
}

variable "primary_networking_resource_group_name" {
}
variable "primary_nsg_name" {
}

variable "hostname" {
}

variable "sqlnicname" {
  default = "sqlnic"
}
variable "webnicname" {
  default = "webnic"
}
