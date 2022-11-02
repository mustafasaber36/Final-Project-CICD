resource "google_compute_network" "main_network" {
  project                 = "moustafa-saber-project"
  name                    = "main-network"
  auto_create_subnetworks = false
}
resource "google_compute_subnetwork" "management_subnet" {
  name          = "management-subnet"
  ip_cidr_range = "10.0.1.0/24"
  region        = var.region
  network       = google_compute_network.main_network.id
}
resource "google_compute_subnetwork" "restricted_subnet" {
  name          = "restricted-subnet"
  ip_cidr_range = "10.0.2.0/24"
  region        = var.region
  network       = google_compute_network.main_network.id
}