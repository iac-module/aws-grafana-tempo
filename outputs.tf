output "s3_bucket_id" {
  description = "The name of the bucket."
  value       = module.s3_bucket.s3_bucket_id
}

output "s3_bucket_arn" {
  description = "The ARN of the bucket. Will be of format arn:aws:s3:::bucketname."
  value       = module.s3_bucket.s3_bucket_arn
}

output "s3_bucket_bucket_domain_name" {
  description = "The bucket domain name. Will be of format bucketname.s3.amazonaws.com."
  value       = module.s3_bucket.s3_bucket_bucket_domain_name
}

output "s3_bucket_bucket_regional_domain_name" {
  description = "The bucket region-specific domain name. The bucket domain name including the region name, please refer here for format. Note: The AWS CloudFront allows specifying S3 region-specific endpoint when creating S3 origin, it will prevent redirect issues from CloudFront to S3 Origin URL."
  value       = module.s3_bucket.s3_bucket_bucket_regional_domain_name
}

output "s3_bucket_hosted_zone_id" {
  description = "The Route 53 Hosted Zone ID for this bucket's region."
  value       = module.s3_bucket.s3_bucket_hosted_zone_id
}

output "s3_bucket_lifecycle_configuration_rules" {
  description = "The lifecycle rules of the bucket, if the bucket is configured with lifecycle rules. If not, this will be an empty string."
  value       = module.s3_bucket.s3_bucket_lifecycle_configuration_rules
}

output "s3_bucket_policy" {
  description = "The policy of the bucket, if the bucket is configured with a policy. If not, this will be an empty string."
  value       = module.s3_bucket.s3_bucket_policy
}

output "s3_bucket_region" {
  description = "The AWS region this bucket resides in."
  value       = module.s3_bucket.s3_bucket_region
}

output "s3_bucket_website_endpoint" {
  description = "The website endpoint, if the bucket is configured with a website. If not, this will be an empty string."
  value       = module.s3_bucket.s3_bucket_website_endpoint
}

output "s3_bucket_website_domain" {
  description = "The domain of the website endpoint, if the bucket is configured with a website. If not, this will be an empty string. This is used to create Route 53 alias records."
  value       = module.s3_bucket.s3_bucket_website_domain
}
#
output "iam_role_arn" {
  description = "ARN of IAM role"
  value       = try(module.iam_eks_role[0].iam_role_arn, "")
}

output "iam_role_name" {
  description = "Name of IAM role"
  value       = try(module.iam_eks_role[0].iam_role_name, "")
}

output "iam_role_path" {
  description = "Path of IAM role"
  value       = try(module.iam_eks_role[0].iam_role_path, "")
}

output "iam_role_unique_id" {
  description = "Unique ID of IAM role"
  value       = try(module.iam_eks_role[0].iam_role_unique_id, "")
}
#
output "iam_policy_description" {
  description = "The description of the policy"
  value       = try(module.iam_s3_policy[0].description, "")
}

output "iam_policy_name" {
  description = "The name of the policy"
  value       = try(module.iam_s3_policy[0].name, "")
}

output "iam_policy_path" {
  description = "The path of the policy in IAM"
  value       = try(module.iam_s3_policy[0].path, "")
}

output "iam_policy_policy" {
  description = "The policy document"
  value       = try(module.iam_s3_policy[0].policy, "")
}
