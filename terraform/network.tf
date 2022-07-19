resource "azurerm_virtual_network" "vnet" {
    name                = var.network_name
    address_space       = ["10.0.0.0/16"]
    location            = azurerm_resource_group.rg1.location
    resource_group_name = azurerm_resource_group.rg1.name
}

 resource "azurerm_subnet" "subnet" {
    name                 = var.subnet_name
    resource_group_name  = azurerm_resource_group.rg1.name
    virtual_network_name = azurerm_virtual_network.vnet.name
    address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "master_nic" {
    name                = "master_vnic"
    location            = azurerm_resource_group.rg1.location
    resource_group_name = azurerm_resource_group.rg1.name

    ip_configuration {
        name                          = var.subnet_name
        subnet_id                     = azurerm_subnet.subnet.id
        private_ip_address_allocation = "Static"
        private_ip_address             = "10.0.2.11"
        public_ip_address_id          = azurerm_public_ip.master_ip_public.id
    }
}

 resource "azurerm_public_ip" "master_ip_public" {
    name                = "ip-publica-master"
    location            = azurerm_resource_group.rg1.location
    resource_group_name = azurerm_resource_group.rg1.name
    allocation_method   = "Dynamic"
    sku                 = "Basic"
}

 resource "azurerm_network_interface" "worker_nic" {
    name                = "worker_vnic"
    location            = azurerm_resource_group.rg1.location
    resource_group_name = azurerm_resource_group.rg1.name

    ip_configuration {
        name                          = var.subnet_name
        subnet_id                     = azurerm_subnet.subnet.id
        private_ip_address_allocation = "Static"
        private_ip_address             = "10.0.2.12"
        public_ip_address_id          = azurerm_public_ip.worker_ip_public.id
    }
}

 resource "azurerm_public_ip" "worker_ip_public" {
    name                = "ip-publica-worker"
    location            = azurerm_resource_group.rg1.location
    resource_group_name = azurerm_resource_group.rg1.name
    allocation_method   = "Dynamic"
    sku                 = "Basic"
}

 resource "azurerm_network_interface" "nfs_nic" {
    name                = "nfs_vnic"
    location            = azurerm_resource_group.rg1.location
    resource_group_name = azurerm_resource_group.rg1.name

    ip_configuration {
        name                          = var.subnet_name
        subnet_id                     = azurerm_subnet.subnet.id
        private_ip_address_allocation = "Static"
        private_ip_address             = "10.0.2.13"
        public_ip_address_id          = azurerm_public_ip.nfs_ip_public.id
    }
}

 resource "azurerm_public_ip" "nfs_ip_public" {
    name                = "ip-publica-nfs"
    location            = azurerm_resource_group.rg1.location
    resource_group_name = azurerm_resource_group.rg1.name
    allocation_method   = "Dynamic"
    sku                 = "Basic"
}



