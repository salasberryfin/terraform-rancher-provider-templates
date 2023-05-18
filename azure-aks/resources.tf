data "rancher2_cloud_credential" "azure" {
  name = "aks-creds"
}

resource "rancher2_cluster" "aks-cluster" {
  name        = "${var.project_name}-${var.owner}"
  description = "AKS cluster created using Terraform provider"
  aks_config_v2 {
    cloud_credential_id = data.rancher2_cloud_credential.azure.id
    resource_group      = var.azure_resource_group
    resource_location   = var.azure_resource_location
    imported            = var.imported_cluster
    dns_prefix          = "${var.project_name}-${var.owner}"
    kubernetes_version  = var.k8s_version
    network_plugin      = "kubenet"
    node_pools {
      availability_zones   = ["1", "2", "3"]
      name                 = "agentpool"
      count                = 1
      enable_auto_scaling  = true
      max_count            = 3
      min_count            = 1
      orchestrator_version = var.k8s_version
      os_disk_size_gb      = 128
      vm_size              = "Standard_DS2_v2"
    }
    node_pools {
      availability_zones   = ["1", "2", "3"]
      name                 = "usermode"
      count                = 1
      orchestrator_version = var.k8s_version
      os_disk_size_gb      = 128
      vm_size              = "Standard_DS2_v2"
    }
  }
}
