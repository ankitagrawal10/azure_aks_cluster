resource "azurerm_kubernetes_cluster" "k8s" {
  location            = var.location
  name                = var.name
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dns_prefix
                                                                                         

  identity {
    type = "SystemAssigned"
  }

  default_node_pool {
    name       = var.node_pool_name
    vm_size    = var.vm_size
    node_count = var.node_count
  }

  network_profile {
    network_plugin    = "kubenet"
    load_balancer_sku = "standard"
  }
}
