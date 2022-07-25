 
  # Creamos el grupo de recurso donde estará todo lo que creemos asociado a este grupo
  resource "azurerm_resource_group" "rg1" {
    name     = var.resource_group_name
    location = var.location_name
  }
# Creamos la máquina virtual master con SO Centros 8 Stream con todos los
# recursos que necesitamos
  resource "azurerm_linux_virtual_machine" "master" {
    name                = "vm-master"
    resource_group_name = azurerm_resource_group.rg1.name
    location            = azurerm_resource_group.rg1.location
    size                = var.maquina_master
    admin_username      = var.ssh_user
    network_interface_ids = [
        azurerm_network_interface.master_nic.id
    ]

  admin_ssh_key {
    username   = var.ssh_user
    public_key = file(var.public_key_path)
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
#Creamos el plan para este tipo de máquinas
  plan {
    name      = "centos-8-stream-free"
    product   = "centos-8-stream-free"
    publisher = "cognosys"
  }

#Para saber que valores poner para la creación de la máquina virtual ponemos el siguiente comando:
#"az vm image list -f centos-8-stream-free -p cognosys --all --output table"
  source_image_reference {
    publisher = "cognosys"
    offer     = "centos-8-stream-free"
    sku       = "centos-8-stream-free"
    version   = "22.03.28"
  }
}
# Creamos la máquina virtual worker con SO Centros 8 Stream con todos los
# recursos que necesitamos
 resource "azurerm_linux_virtual_machine" "worker" {
    name                = "vm-worker"
    resource_group_name = azurerm_resource_group.rg1.name
    location            = azurerm_resource_group.rg1.location
    size                = var.maquina_generica
    admin_username      = var.ssh_user
    network_interface_ids = [
        azurerm_network_interface.worker_nic.id
    ]

  admin_ssh_key {
    username   = var.ssh_user
    public_key = file(var.public_key_path)
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
#Creamos el plan para este tipo de máquinas
  plan {
    name      = "centos-8-stream-free"
    product   = "centos-8-stream-free"
    publisher = "cognosys"
  }
#Para saber que valores poner para la creación de la máquina virtual ponemos el siguiente comando:
#"az vm image list -f centos-8-stream-free -p cognosys --all --output table"
  source_image_reference {
    publisher = "cognosys"
    offer     = "centos-8-stream-free"
    sku       = "centos-8-stream-free"
    version   = "22.03.28"
  }
}
# Creamos la máquina virtual nfs con SO Centros 8 Stream con todos los
# recursos que necesitamos
 resource "azurerm_linux_virtual_machine" "nfs" {
    name                = "vm-nfs"
    resource_group_name = azurerm_resource_group.rg1.name
    location            = azurerm_resource_group.rg1.location
    size                = var.maquina_generica
    admin_username      = var.ssh_user
    network_interface_ids = [
        azurerm_network_interface.nfs_nic.id
    ]

  admin_ssh_key {
    username   = var.ssh_user
    public_key = file(var.public_key_path)
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
#Creamos el plan para este tipo de máquinas
  plan {
    name      = "centos-8-stream-free"
    product   = "centos-8-stream-free"
    publisher = "cognosys"
  }

#Para saber que valores poner para la creación de la máquina virtual ponemos el siguiente comando:
#"az vm image list -f centos-8-stream-free -p cognosys --all --output table"
  source_image_reference {
    publisher = "cognosys"
    offer     = "centos-8-stream-free"
    sku       = "centos-8-stream-free"
    version   = "22.03.28"
  }
}