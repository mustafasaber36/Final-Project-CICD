#router-for-attaching-private-ip-to-public-ip

resource "google_compute_router" "router" {
  name    = "my-router"
  region  = var.region
  network = google_compute_network.main_network.id
}
#nat-for-accessing-the-internet-automode

resource "google_compute_router_nat" "nat" {
  name                   = "my-nat"
  router                 = google_compute_router.router.name
  region                 = var.region
  nat_ip_allocate_option = "AUTO_ONLY"

  #list-of-subnets-attached-to-nat

  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
    subnetwork              {
    name                    = google_compute_subnetwork.management_subnet.id
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
    }
    subnetwork              {
    name                    = google_compute_subnetwork.restricted_subnet.id
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
    }





}