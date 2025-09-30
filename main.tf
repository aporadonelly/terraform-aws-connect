#This root main.tf orchestrates modules.

module "instance" { #→ creates the Connect instance
  source         = "./modules/connect_instance"
  project_prefix = var.project_prefix
}


module "queue" { #→ creates queue/routing/security tied to that instance
  source         = "./modules/connect_queue"
  instance_id    = module.instance.id
  project_prefix = var.project_prefix
}

module "user" { #→ will create users tied to that queue/routing/security
  source              = "./modules/connect_user"
  instance_id         = module.instance.id
  routing_profile_id  = module.queue.routing_profile_id
  security_profile_id = module.queue.security_profile_id
}
