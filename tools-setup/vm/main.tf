resource "azurerm_public_ip" "publicip" {
  name                  = var.name
  location              = var.location
  resource_group_name   = var.rg_name
  allocation_method     = "Dynamic"
  sku                   = "Basic" 
}

resource "azurerm_network_interface" "privateip" {
  depends_on = [ azurerm_public_ip.publicip ]
  name                  = var.name
  location              = var.location
  resource_group_name   = var.rg_name

  ip_configuration {
    name                          = var.name
    subnet_id                     = "/subscriptions/4a491ea7-cd6d-4ec6-aa18-28b31973e70c/resourceGroups/devops_project_ecom/providers/Microsoft.Network/virtualNetworks/workstation-vnet/subnets/default"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.publicip.id
  }
}

resource "azurerm_network_interface_security_group_association" "nsg-allow" {
  network_interface_id      = azurerm_network_interface.privateip.id
  network_security_group_id = "/subscriptions/4a491ea7-cd6d-4ec6-aa18-28b31973e70c/resourceGroups/devops_project_ecom/providers/Microsoft.Network/networkSecurityGroups/allow_all"
}

resource "azurerm_linux_virtual_machine" "vm" {
  location              = var.location
  name                  = var.name
  network_interface_ids = [azurerm_network_interface.privateip.id]
  resource_group_name   = var.rg_name
  size                  = var.vm_size
  admin_username        = "harshal"
  admin_password        = "harshal@12345"

  source_image_id = "/subscriptions/4a491ea7-cd6d-4ec6-aa18-28b31973e70c/resourceGroups/devops_project_ecom/providers/Microsoft.Compute/images/image"

  os_disk {
    name              = "${var.name}-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
#  delete_os_disk_on_termination = true
#
#   os_profile_linux_config {
#     disable_password_authentication = false
#   }
}

# resource "azurerm_virtual_machine" "vm" {
#   depends_on                    = [ azurerm_network_interface.privateip ]
#   name                          = var.name
#   location                      = var.location
#   resource_group_name           = var.rg_name
#   network_interface_ids         = [azurerm_network_interface.privateip.id]
#   vm_size                       = var.vm_size
#   # Uncomment this line to delete the OS disk automatically when deleting the VM
#   delete_os_disk_on_termination = true
#   # Uncomment this line to delete the data disks automatically when deleting the VM
#   # delete_data_disks_on_termination = true
#
#   storage_image_reference {
#     id = "/subscriptions/4a491ea7-cd6d-4ec6-aa18-28b31973e70c/resourceGroups/devops_project_ecom/providers/Microsoft.Compute/images/image"
#   }
#
#   storage_os_disk {
#     name              = "${var.name}-disk"
#     caching           = "ReadWrite"
#     create_option     = "FromImage"
#     managed_disk_type = "Standard_LRS"
#   }
#
#   os_profile {
#     computer_name  = var.name
#     admin_username = "harshal"
#     admin_password = "harshal@12345"
#   }
#
#   os_profile_linux_config {
#     disable_password_authentication = false
#   }
# }

resource "azurerm_dns_a_record" "dns_private" {
  depends_on            = [ azurerm_linux_virtual_machine.vm ]
  name                  = "${var.name}-int"
  zone_name             = "harshaldevops.online"
  resource_group_name   = var.rg_name
  ttl                   = 60
  records               = [azurerm_network_interface.privateip.private_ip_address]
}

resource "azurerm_dns_a_record" "dns_public" {
  depends_on            = [ azurerm_linux_virtual_machine.vm ]
  name                  = var.name
  zone_name             = "harshaldevops.online"
  resource_group_name   = var.rg_name
  ttl                   = 60
  records               = [azurerm_public_ip.publicip.ip_address]
}