#firewall for the managemnet subent
resource "google_compute_firewall" "management_rule" {
  project       = "moustafa-saber-project"
  name          = "management-firewall-rule"
  network       = google_compute_network.main_network.id
  description   = "allow only IAP cidr range for management subnet"
  source_ranges = ["35.235.240.0/20"]
  direction     = "INGRESS"
  allow {
    protocol = "tcp"
    ports    = ["22", "80"]
  }
  target_tags = ["management-instance"]

}
#firewall for the restricted subnet 

# resource "google_compute_firewall" "restricted_rule_ingress" {
#   project       = "moustafa-saber-project"
#   name          = "restricted-firewall-rule"
#   network       = google_compute_network.main_network.id
#   description   = "allow only management cidr for restricted subnet"
#   source_ranges = ["10.0.1.0/24"]
#   direction     = "INGRESS"
#   priority      = 700
#   allow {
#     protocol = "tcp"
#     ports    = ["22", "80"]
#   }
#   source_tags = ["management-instance"]
#   target_tags = ["restricted-cluster"]
# }
# #firewall to prevent restricted subnet access to internet
# resource "google_compute_firewall" "restricted_rule_egress" {
#   project       = "moustafa-saber-project"
#   name          = "restricted-firewall-rule"
#   network       = google_compute_network.main_network.id
#   description   = "prevent accessing the internet by restricted subnet"
#   source_ranges = ["10.0.2.0/24"]
#   direction     = "EGRESS"
#   priority      = 1000
#   deny {
#     protocol = "all"
#     ports    = ["all"]
#   }
# }


