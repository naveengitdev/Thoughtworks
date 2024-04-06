module "test-vm" {
  source = "../test"
  rg = "test-rg"
  rg_location = "centralindia"
  subnet_name = "default-subnet"
  vnet_name = "test-vnet"
  nic_name = "test-nic"
  vm_name = "test-vm"
}
