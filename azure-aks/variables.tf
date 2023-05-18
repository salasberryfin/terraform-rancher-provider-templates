variable "rancher2_url" {
  type = string
}

variable "rancher2_access_key" {
  type = string
}

variable "rancher2_secret_key" {
  type = string
}

variable "azure_resource_group" {
  type = string
}

variable "project_name" {
  type = string
}

variable "owner" {
  type = string
}

variable "k8s_version" {
  type    = string
  default = "1.25.5"
}

variable "imported_cluster" {
  type    = bool
  default = false
}

variable "azure_resource_location" {
  type    = string
  default = "westeurope"
}
