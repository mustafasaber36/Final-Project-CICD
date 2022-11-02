resource "google_container_node_pool" "primary_preemptible_nodes" {
  name       = "my-node-pool"
  location   = var.zone
  cluster    = google_container_cluster.my-gke-cluster.name
  node_count = 3
  node_config {
    preemptible     = true
    machine_type    = "e2-medium"
    disk_size_gb    = 20
    disk_type       = "pd-standard"
    service_account = google_service_account.node-service-account.email
    oauth_scopes    = ["https://www.googleapis.com/auth/cloud-platform"]
    tags            = ["resrtricted-cluster"]
  }
  upgrade_settings {
    max_surge       = 1
    max_unavailable = 0
  }
}