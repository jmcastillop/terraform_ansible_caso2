 
  resource "azurerm_resource_group" "rg1" {
    name     = var.resource_group_name
    location = var.location_name
  }

  resource "azurerm_linux_virtual_machine" "master" {
    name                = "vm-master"
    resource_group_name = azurerm_resource_group.rg1.name
    location            = azurerm_resource_group.rg1.location
    size                = "Standard_D2_v3"
    admin_username      = "azureuser"
    network_interface_ids = [
        azurerm_network_interface.master_nic.id
    ]

  admin_ssh_key {
    username   = "azureuser"
    public_key = file("~/.ssh/id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  plan {
    name      = "centos-8-stream-free"
    product   = "centos-8-stream-free"
    publisher = "cognosys"
  }

  source_image_reference {
    publisher = "cognosys"
    offer     = "centos-8-stream-free"
    sku       = "centos-8-stream-free"
    version   = "22.03.28"
  }
}

 resource "azurerm_linux_virtual_machine" "worker" {
    name                = "vm-worker"
    resource_group_name = azurerm_resource_group.rg1.name
    location            = azurerm_resource_group.rg1.location
    size                = "Standard_A2_v2"
    admin_username      = "azureuser"
    network_interface_ids = [
        azurerm_network_interface.worker_nic.id
    ]

  admin_ssh_key {
    username   = "azureuser"
    public_key = file("~/.ssh/id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  plan {
    name      = "centos-8-stream-free"
    product   = "centos-8-stream-free"
    publisher = "cognosys"
  }

  source_image_reference {
    publisher = "cognosys"
    offer     = "centos-8-stream-free"
    sku       = "centos-8-stream-free"
    version   = "22.03.28"
  }
}

 resource "azurerm_linux_virtual_machine" "nfs" {
    name                = "vm-nfs"
    resource_group_name = azurerm_resource_group.rg1.name
    location            = azurerm_resource_group.rg1.location
    size                = "Standard_A2_v2"
    admin_username      = "azureuser"
    network_interface_ids = [
        azurerm_network_interface.nfs_nic.id
    ]

  admin_ssh_key {
    username   = "azureuser"
    public_key = file("~/.ssh/id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  plan {
    name      = "centos-8-stream-free"
    product   = "centos-8-stream-free"
    publisher = "cognosys"
  }

  source_image_reference {
    publisher = "cognosys"
    offer     = "centos-8-stream-free"
    sku       = "centos-8-stream-free"
    version   = "22.03.28"
  }
}