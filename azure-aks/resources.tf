data "rancher2_cloud_credential" "azure" {
  name = "aks-creds"
}

resource "rancher2_cluster" "aks-cluster" {
  name        = "validation-tf-provider"
  description = "AKS cluster created using Terraform provider"
  aks_config_v2 {
    cloud_credential_id = data.rancher2_cloud_credential.azure.id
    resource_group      = var.azure_resource_group
    resource_location   = var.azure_resource_location
    dns_prefix          = "validation-tf-provider"
    kubernetes_version  = "1.24.6"
    node_pools {
      availability_zones   = ["1", "2", "3"]
      name                 = "agentpool"
      count                = 1
      orchestrator_version = "1.21.2"
      os_disk_size_gb      = 128
      vm_size              = "Standard_DS2_v2"
    }
  }
}
