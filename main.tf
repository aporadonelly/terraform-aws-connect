#This root main.tf orchestrates modules.

module "instance" {
  source         = "./modules/connect_instance"
  project_prefix = var.project_prefix
}
