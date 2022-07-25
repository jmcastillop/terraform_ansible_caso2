# Declaramos la variables de salida
output "resource_group_id" {
  value = azurerm_resource_group.rg1.id
}

output "master_id" {
  value = azurerm_linux_virtual_machine.master.id
}

output "worker_id" {
  value = azurerm_linux_virtual_machine.worker.id
}