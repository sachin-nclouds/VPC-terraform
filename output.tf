output "vpc_id" {
  value = module.vpc.vpc_id
}


output "subnet_1" {
  value = module.vpc.subnet_1
}

output "subnet_2" {
  value = module.vpc.subnet_2
}

output "gw" {
  value = module.vpc.gw
}
output "nat-gw" {
  value = module.vpc.nat-gw
}