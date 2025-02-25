output "aks_cluster_name" {
  value = module.aks_cluster.aks_cluster_name
}

output "resource_group_name" {
  value = module.aks_cluster.resource_group_name
}


output "login_server_name" {
    value = module.acr_registry.container_registry_login_server
}

output "username" {
    value = module.acr_registry.container_registry_username
}

output "password" {
    value = module.acr_registry.container_registry_password
    sensitive = true
}