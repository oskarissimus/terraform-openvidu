module "bastion" {
  source = "./bastion"
  random=local.random
  bastion_name = local.bastion_name

  nat_ip = module.networking.bastion_nat_ip
  provider_subnetwork_name = module.networking.bastion_subnetwork_name

  depends_on = [module.networking]
}