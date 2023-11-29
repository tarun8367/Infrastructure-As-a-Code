module "acm" {
  source  = "terraform-aws-modules/acm/aws"
  version = "5.0.0"


  domain_name = trimsuffix(data.aws_route53_zone.mydomain.name, ".")
  zone_id     = data.aws_route53_zone.mydomain.zone_id

  validation_method = "DNS"

  subject_alternative_names = [
    "*.thetkc.shop",
  ]

  wait_for_validation = true

  tags = local.common_tags

}
# Output ACM Certificate ARN
output "acm_certificate_arn" {
  description = "ACM Certificate ARN"
  value       = module.acm.acm_certificate_arn
}
