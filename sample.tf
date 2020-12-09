module "vm1" {
  source = "github.com/global-azure/terraform-azurerm-vm.git"
  vm_count              = 2
  vm_count_start        = 1
  vm_count_zero_padding = 2 # Set to 0 to create a single server with no number suffix
  rsg            = "LOC-ENV-RSG-CODE-SERVICE"
  vm_name        = "locenvcodeapp"
  # vm_name_suffix = ""
  vm_size        = "Standard_D2s_v3"
  os_disk_sku    = "Standard_LRS"
  os_disk_size   = 128
  # nic_dns                      = ["dnsname1", "dnsname2"]
  # nic_private_ip_address_start = "192.168.50.4"
  # nic_pip_id                   = module.pip.exports.*.id
  # nic_accelerated_networking   = false
  nic_subnet_id = "/subscriptions/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/resourceGroups/LOC-ENV-RSG-CODE-SERVICE/providers/Microsoft.Network/virtualNetworks/LOC-VNET01/subnets/LOC-VNET01-ENV-APP"
  # Uncomment to define either an Availability Set or Availability Zone.
  # For zones, define which zones to create the VM(s) in. Will loop in ascending order (eg. 1, 2, 3, 1, 2, 3)
  # vm_avset_id = "/subscriptions/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/resourceGroups/LOC-ENV-RSG-CODE-SERVICE/providers/Microsoft.Compute/availabilitySets/locenvcodeapp-as"
  # vm_avzones  = ["1", "2", "3"]
  # vm_ppg      = "/subscriptions/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/resourceGroups/LOC-ENV-RSG-CODE-SERVICE/providers/Microsoft.Compute/proximityPlacementGroups/locenvcodeapp-ppg"
  vm_os_type      = "Windows" # Either Windows or Linux
  image_publisher = "MicrosoftWindowsServer"
  image_offer     = "WindowsServer"
  image_sku       = "2019-Datacenter"
  # image_version   = "latest"
  # image_id        = "/subscriptions/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/resourceGroups/LOC-ENV-RSG-CODE-SERVICE/providers/Microsoft.Compute/images/locenvcodeapp-image-20200423110050"
  # windows_license = ""
  # drive_list = var.data_drives
  # vm_timezone    = "UTC"
  # admin_username = "custom-admin"
  admin_password      = random_string.password_vm.result
  vm_boot_diagnostics = data.azurerm_storage_account.diagnostics.primary_blob_endpoint
  location        = var.location
  environment     = var.environment
  tag_buildby     = var.buildby
  tag_buildticket = var.buildticket
  tag_builddate   = var.builddate
  # tag_automation_exclude = "Passport"
}