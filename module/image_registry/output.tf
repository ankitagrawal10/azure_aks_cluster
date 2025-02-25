output "container_registry_login_server" {
    value = azurerm_container_registry.image_rgistry.login_server
}


output "container_registry_username" {
    value = azurerm_container_registry.image_rgistry.admin_username
}

output "container_registry_password" {
    value = azurerm_container_registry.image_rgistry.admin_password
}