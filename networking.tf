module "networking" {
  source = "./networking"
  random = local.random
  bastion_name = local.bastion_name
  openvidu_name = local.openvidu_name
}