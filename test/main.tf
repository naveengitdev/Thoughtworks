resource "azurerm_resource_group" "rg" {
  name     = var.rg
  location = var.rg_location
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  address_space       = ["10.0.0.0/16"]
  location            = var.rg_location
  resource_group_name = var.rg
}

resource "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  resource_group_name  = var.rg
  virtual_network_name = var.vnet_name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "nic" {
  name                = var.nic_name
  location            = var.rg_location
  resource_group_name = var.rg

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "vm" {
  name                = var.vm_name
  resource_group_name = var.rg
  location            = var.rg_location
  size                = "Standard_B2s"
  admin_username      = "adminuser"
  admin_password = "Pa55w.rd@1234"
  network_interface_ids = [
    azurerm_network_interface.nic.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "RedHat"
    offer     = "RHEL"
    sku       = "8-lvm-gen2"
    version   = "latest"
  }

  custom_data = filebase64("../module/install_mediawiki.yaml")
}
