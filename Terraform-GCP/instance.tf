
#===================the custome service account=================== 
resource "google_service_account" "vm-service-account" {
  account_id   = "service-account-management"
  display_name = "Service Account"
}
# resource "google_project_iam_member" "objectViewer" {
#   project = "moustafa-saber-project"
#   role    = "roles/storage.objectViewer"
#   member  = "serviceAccount:${google_service_account.vm-service-account.email}"
# }

# resource "google_project_iam_binding" "container-service" {
#   project = "moustafa-saber-project"
#   role    = "roles/container.Admin"
#   members  = ["serviceAccount:${google_service_account.vm-service-account.email}"]
# }

#===========================the management instance====================

resource "google_compute_instance" "management_instance" {
  name         = "management-instance"
  machine_type = "e2-medium"
  zone         = var.zone
  tags         = ["management-instance"]
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }
  service_account {
    email  = google_service_account.vm-service-account.email
    scopes = ["cloud-platform"]
  }
  network_interface {
    network    = "main-network"
    subnetwork = "management-subnet"
  }


}