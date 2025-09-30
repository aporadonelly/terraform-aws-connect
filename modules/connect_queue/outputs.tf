output "routing_profile_id" {
  value = aws_connect_routing_profile.default.routing_profile_id
}

output "security_profile_id" {
  value = aws_connect_security_profile.agent.security_profile_id
}
