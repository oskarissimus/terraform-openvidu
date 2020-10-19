module "openvidu" {
  source = "./openvidu"
  random=local.random
  openvidu_name = local.openvidu_name

  openvidu_subnetwork_name = module.networking.elastic_subnetwork_name
  nat_ip = module.networking.openvidu_nat_ip

  depends_on = [module.networking]
}