output "routing_profile_id" {
  value = aws_connect_routing_profile.default.id
}

output "security_profile_id" {
  value = aws_connect_security_profile.agent.id
}
