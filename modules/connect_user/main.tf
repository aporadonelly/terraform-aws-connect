resource "aws_connect_user" "customer-service" {
  instance_id          = var.instance_id
  name                 = "nelly-agent"
  password             = "P-A-S-S-w-0-r-D"
  security_profile_ids = [var.security_profile_id]
  routing_profile_id   = var.routing_profile_id
  hierarchy_group_id   = null

  identity_info {
    first_name = "Nel"
    last_name  = "Ly"
    email      = "sample@gmail.com"
  }

  phone_config {
    after_contact_work_time_limit = 0
    phone_type                    = "SOFT_PHONE"
  }
}
