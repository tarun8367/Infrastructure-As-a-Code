# AWS EC2 Instance Terraform Outputs
# Public EC2 Instances - Bastion Host
output "ec2_bastion_public_instance_ids" {
  description = "List of IDs of instances"
  value       = module.ec2_public.id
}
output "ec2_bastion_public_ip" {
  description = "List of Public ip address assigned to the instances"
  value       = module.ec2_public.public_ip
}
# Private app1 EC2 Instances
output "app1_ec2_private_instance_ids" {
  description = "List of IDs of instances"
  value       = [for ec2private in module.ec2_private_app1 : ec2private.id]
}
output "app1_ec2_private_ip" {
  description = "List of private ip address assigned to the instances"
  value       = [for ec2private in module.ec2_private_app1 : ec2private.private_ip]
}

# Private app2 EC2 Instances
output "app2_ec2_private_instance_ids" {
  description = "List of IDs of instances"
  value       = [for ec2private in module.ec2_private_app2 : ec2private.id]
}
output "app2_ec2_private_ip" {
  description = "List of private ip address assigned to the instances"
  value       = [for ec2private in module.ec2_private_app2 : ec2private.private_ip]
}

