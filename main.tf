module "rg" {
  source = "./module/resource_group"
  name = "ankit-rg"
  location = "East US"
}

module "virtual-net" {
  source = "./module/virtual_network"
  name = "vnet"
  address_space = ["10.0.0.0/16"]
  location = module.rg.location
  resource_group_name = module.rg.resource_group_name
}


module "virtual_subnet"{
  source = "./module/subnet"
  name = "virtual-subnet"
  resource_group_name = module.rg.resource_group_name
  virtual_network_name = module.virtual-net.name
  address_prefixes = ["10.0.0.0/24"]
}

module "aks_cluster" {
  source = "./module/k8s_cluster"
  location = module.rg.location
  name = "ankit-cluster"
  resource_group_name = module.rg.resource_group_name
  dns_prefix = "dns-${random_pet.azurerm_kubernetes_cluster_dns_prefix.id}"
  node_pool_name = "agentpool"
  vm_size = "Standard_D2_v2"
  node_count = 1
}


resource "random_pet" "azurerm_kubernetes_cluster_dns_prefix" {
  prefix = "dns"
}



module "acr_registry" {
  source = "./module/image_registry"
  name = "projectimage01"
  resource_group_name = module.rg.resource_group_name
  location = module.rg.location
}


