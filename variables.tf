variable "zone" {
  description = "The zone name for zonal cluster"
  type        = string
}

variable "cluster_name" {
  description = "The name of the GKE cluster"
  type        = string
}

variable "network_name" {
  description = "The name of the VPC network"
  type        = string
}

variable "subnet_name" {
  description = "The name of the subnet"
  type        = string
}

variable "subnet_compute" {
  description = "The name of the compute tooling subnet"
  type        = string
}


variable "master_ipv4_cidr_block" {
  description = "The /28 CIDR block for the GKE master's private endpoint"
  type        = string
}

variable "node_pool_name" {
  description = "The name of the node pool"
  type        = string
}

variable "node_pool_machine_type" {
  description = "The machine type of the nodes in the node pool"
  type        = string
}

variable "gke_version" {
  description = "The gke_version in the node pool"
  type        = string
}

variable "disk_size_gb" {
  description = "The machine boot disk size in the node pool"
  type        = string
}

variable "node_pool_node_count" {
  description = "The initial node count in the node pool"
  type        = number
}


variable "node_pool_labels" {
  description = "Labels to be assigned to nodes in the node pool"
  type        = map(string)
}

variable "node_pool_tags" {
  description = "Tags to be assigned to nodes in the node pool"
  type        = list(string)
}
