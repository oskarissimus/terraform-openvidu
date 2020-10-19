resource "google_compute_network" "network" {
  name   = "network-${var.random}"
  auto_create_subnetworks = false
}

resource "google_compute_address" "bastion" {
  name = var.bastion_name
}

resource "google_compute_address" "openvidu" {
  name = var.openvidu_name
}

resource "google_compute_subnetwork" "bastion" {
  ip_cidr_range = "10.0.1.0/24"
  name = var.bastion_name
  network = google_compute_network.network.name
  depends_on = [google_compute_network.network]
}

resource "google_compute_subnetwork" "openvidu" {
  ip_cidr_range = "10.0.10.0/24"
  name = var.openvidu_name
  network = google_compute_network.network.name
  depends_on = [google_compute_network.network]
}