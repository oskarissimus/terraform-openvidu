output "bastion_nat_ip" {
  value = google_compute_address.bastion.address
}

output "openvidu_nat_ip" {
  value = google_compute_address.openvidu.address
}

output "bastion_subnetwork_name" {
  value = google_compute_subnetwork.bastion.name
}

output "elastic_subnetwork_name" {
  value = google_compute_subnetwork.openvidu.name
}