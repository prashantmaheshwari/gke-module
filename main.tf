resource "google_container_cluster" "primary" {
  name     = var.cluster_name
  location = var.zone

  network    = var.network_name
  subnetwork = var.subnet_name
  
  remove_default_node_pool = true  
  initial_node_count = 1
  node_config {
    disk_size_gb = "10"
  }

  private_cluster_config {
    enable_private_endpoint = true
    enable_private_nodes    = true
    master_ipv4_cidr_block  = var.master_ipv4_cidr_block
  }

  master_authorized_networks_config {
    cidr_blocks {
        cidr_block   = var.subnet_compute
        display_name = "compute-tooling"
      }
    }
}

resource "google_container_node_pool" "primary_nodes" {
  cluster    = google_container_cluster.primary.name
  location   = var.zone
  name       = var.node_pool_name
  node_count = var.node_pool_node_count
  version    = var.gke_version

  node_config {
    machine_type = var.node_pool_machine_type
    disk_size_gb = var.disk_size_gb

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
       "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring"
    ]
    
    labels = var.node_pool_labels
    tags   = var.node_pool_tags
  }


  management {
    auto_upgrade = true
    auto_repair  = true
  }
}
