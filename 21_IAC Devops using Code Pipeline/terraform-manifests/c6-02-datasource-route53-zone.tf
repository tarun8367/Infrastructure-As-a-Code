# Get DNS information from AWS Route53
data "aws_route53_zone" "mydomain" {
  name = "thetkc.shop"
}

# Output MyDomain Zone ID
output "mydomain_zoneid" {
  description = "The Hosted Zone id of the desired Hosted Zone"
  value       = data.aws_route53_zone.mydomain.zone_id
}

output "mydomain_name" {
  description = "Domain Name :"
  value       = data.aws_route53_zone.mydomain.name
}