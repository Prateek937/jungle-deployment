module "network" {
  source = "../../Modules/NETWORK"
  for_each = var.regions
  region = each.value
}

module "apps_deployment" {
  source = ".../../Modules/SERVER_DEPLOYMENT"
  for_each = var.image_names
  region = var.regions[each.key] 
  image = each.value
}
