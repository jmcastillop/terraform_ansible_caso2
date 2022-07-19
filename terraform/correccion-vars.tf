variable "resource_group_name" {
  default = "rg1-resources"
}

variable "location_name" {
  type = string
  description = "Región de Azure donde crearemos la infraestructura"
  default = "uksouth"
}

variable "storage_account"{
  type = string
  description = "Nombre de la storage account"
  default = "storage"
}

variable "public_key_path"{
  type = string
  description = "Ruta para la clave pública de acceso a las instancias"
  default = "~/.ssh/id_rsa.pub"
}

variable "ssh_user" {
  type = string
  description = "Usuario para hacer ssh"
  default = "azureuser"
}

variable "network_name" {
  default = "vnet1-network"
}

variable "subnet_name" {
  default = "subnet1"
}

variable "public_ip_name" {
  default = "public_ip"
}
