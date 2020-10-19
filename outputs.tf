output "bastion_nat_ip" {
  value = module.networking.bastion_nat_ip
}

output "openvidu_nat_ip" {
  value = module.networking.openvidu_nat_ip
}