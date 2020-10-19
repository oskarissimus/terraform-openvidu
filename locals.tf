locals {
  random=random_string.random_str.result
  bastion_name = "bastion-${local.random}"
  openvidu_name = "openvidu-${local.random}"
}