resource "aws_connect_instance" "connect_nelly_demo" {
  identity_management_type = "CONNECT_MANAGED"
  inbound_calls_enabled    = true
  instance_alias           = "${var.project_prefix}-instance"
  outbound_calls_enabled   = true
}
