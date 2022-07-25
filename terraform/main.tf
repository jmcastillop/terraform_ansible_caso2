# Definimos el provider de Azure
# para poder acceder con
# Obtengo este código de esta url: 
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine
 terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.14.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
  features {}
}
