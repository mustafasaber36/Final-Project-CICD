resource "google_container_cluster" "my-gke-cluster" {
  name                     = "my-gke-cluster"
  location                 = var.zone
  network                  = google_compute_network.main_network.id
  subnetwork               = google_compute_subnetwork.restricted_subnet.id

  remove_default_node_pool = true
  initial_node_count       = 1
  master_authorized_networks_config {
    cidr_blocks {
      cidr_block = "${google_compute_instance.management_instance.network_interface.0.network_ip}/32" #dont forget to enter the value of vm private ip
    }
  }
  ip_allocation_policy {}
  private_cluster_config {
    enable_private_endpoint = true
    enable_private_nodes    = true
    master_ipv4_cidr_block  = "172.16.0.32/28"
    master_global_access_config {
      enabled = false
    }
  }
  addons_config {
    http_load_balancing {
      disabled = false
    }
  }
}