# Terraform Output Values
output "instance_publicip" {
  description = "EC2 Instance Public IP"
  value       = aws_instance.myec2vm.public_ip
}

output "instance_publicdns" {
  description = "EC2 Instance Public DNS"
  value       = aws_instance.myec2vm.public_dns
}

output "instance_zone" {
  description = "EC2 instance availabilty Zone"
  value       = aws_instance.myec2vm.availability_zone
}