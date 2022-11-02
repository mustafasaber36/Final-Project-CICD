resource "google_service_account" "node-service-account" {
  account_id   = "service-account-node"
  display_name = "Nodes Service Account"
}

resource "google_project_iam_member" "containeradmin" {
  project = "moustafa-saber-project"
  role    = "roles/container.admin"
  member  = "serviceAccount:${google_service_account.node-service-account.email}"
}

resource "google_project_iam_member" "storageadmin" {
  project = "moustafa-saber-project"
  role    = "roles/storage.admin"
  member  = "serviceAccount:${google_service_account.node-service-account.email}"
}
















