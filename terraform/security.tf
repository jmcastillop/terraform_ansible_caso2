resource "azurerm_network_security_group" "master" {
    name                = "master_security"
    location            = azurerm_resource_group.rg1.location
    resource_group_name = azurerm_resource_group.rg1.name
    
    security_rule {
        name                       = "SSH"
        priority                   = 1001
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }
    
    security_rule {
        name                       = "IngressController"
        priority                   = 1002
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "3000-32767"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }
    
}

resource "azurerm_network_security_group" "worker" {
    name                = "worker_security"
    location            = azurerm_resource_group.rg1.location
    resource_group_name = azurerm_resource_group.rg1.name
    
    security_rule {
        name                       = "SSH"
        priority                   = 1001
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }
    
}

resource "azurerm_network_security_group" "nfs" {
    name                = "nfs_security"
    location            = azurerm_resource_group.rg1.location
    resource_group_name = azurerm_resource_group.rg1.name
    
    security_rule {
        name                       = "SSH"
        priority                   = 1001
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }
    
}

resource "azurerm_network_interface_security_group_association" "master" {
    network_interface_id      = azurerm_network_interface.master_nic.id
    network_security_group_id = azurerm_network_security_group.master.id
}

resource "azurerm_network_interface_security_group_association" "worker" {
    network_interface_id      = azurerm_network_interface.worker_nic.id
    network_security_group_id = azurerm_network_security_group.worker.id
}

resource "azurerm_network_interface_security_group_association" "nfs" {
    network_interface_id      = azurerm_network_interface.nfs_nic.id
    network_security_group_id = azurerm_network_security_group.nfs.id
}