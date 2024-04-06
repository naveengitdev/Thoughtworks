variable "rg" {
  description = "RG Name"
  type = string
  default = ""
}

variable "rg_location" {
  description = "RG Location"
  type = string
  default = ""
}

variable "vnet_name" {
    description = "Vnet name"
    type = string
    default = ""
}

variable "subnet_name" {
    description = "Subnet name"
    type = string
    default = ""
}


variable "nic_name" {
    description = "NIC name"
    type = string
    default = ""
}


variable "vm_name" {
    description = "VM name"
    type = string
    default = ""
}
