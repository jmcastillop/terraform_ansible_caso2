# Variables de entrada
# Declaramos la variable del grupo del recurso
variable "resource_group_name" {
  default = "rg1-resources"
}

# Declaramos la variable de la región de la infraestructura de azure
variable "location_name" {
  type = string
  description = "Región de Azure donde crearemos la infraestructura"
  default = "uksouth"
}

# Declaramos la variable de la cuenta de almacenamiento
variable "storage_account"{
  type = string
  description = "Nombre de la storage account"
  default = "storage"
}

# Declaramos la variable del fichero de la clave publica para copiar a las máquinas que crearemos
variable "public_key_path"{
  type = string
  description = "Ruta para la clave pública de acceso a las instancias"
  default = "~/.ssh/id_rsa.pub"
}

# Declaramos la variable del tamaño y requisitos de la máquina master
# https://docs.microsoft.com/es-es/azure/cloud-services/cloud-services-sizes-specs
# Necesitamos tener para esta máquina 
#    Size        CPU Memoria  HDD
# Standard_D2_v3	2	    8	    50GB
variable "maquina_master" {
  type = string
  description = "Tipo de máquina maquina"
  default = "Standard_D2_v3"
}

# Declaramos la variable del tamaño de la máquina y requisitos de la máquina worker y nfs
# https://docs.microsoft.com/es-es/azure/cloud-services/cloud-services-sizes-specs
# Necesitamos tener para esta máquina 
#    Size        CPU Memoria  HDD
# Standard_A2_v2	2	    4	    20GB
variable "maquina_generica" {
  type = string
  description = "Tipo de máquina maquina"
  default = "Standard_A2_v2"
}

# Declaramos la variable del usuario ssh con el cual nos conectaremos desde el nodo centralizado
variable "ssh_user" {
  type = string
  description = "Usuario para hacer ssh"
  default = "azureuser"
}

# Declaramos la variable de la vnet
variable "network_name" {
  default = "vnet1-network"
}

# Declaramos la variable de la subnet
variable "subnet_name" {
  default = "subnet1"
}

# Declaramos la variable de la ip_publica que tendrás las máquinas
variable "public_ip_name" {
  default = "public_ip"
}
