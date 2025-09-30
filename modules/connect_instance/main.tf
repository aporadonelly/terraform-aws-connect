resource "random_id" "suffix" {
  byte_length = 2
}

resource "aws_connect_instance" "connect_nelly_demo" {
  identity_management_type = "CONNECT_MANAGED"
  inbound_calls_enabled    = true
  instance_alias           = "${var.project_prefix}-instance-${random_id.suffix.hex}"
  outbound_calls_enabled   = true
}
