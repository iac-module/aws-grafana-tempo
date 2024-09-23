# aws-grafana-loki
# S3 bucket and IRSA role for Grafana Tempo 
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.9 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.62 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 5.62 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_iam_eks_role"></a> [iam\_eks\_role](#module\_iam\_eks\_role) | git::https://github.com/terraform-aws-modules/terraform-aws-iam.git//modules/iam-role-for-service-accounts-eks | 89fe17a6549728f1dc7e7a8f7b707486dfb45d89 |
| <a name="module_iam_s3_policy"></a> [iam\_s3\_policy](#module\_iam\_s3\_policy) | git::https://github.com/terraform-aws-modules/terraform-aws-iam.git//modules/iam-policy | 89fe17a6549728f1dc7e7a8f7b707486dfb45d89 |
| <a name="module_s3_bucket"></a> [s3\_bucket](#module\_s3\_bucket) | git::https://github.com/terraform-aws-modules/terraform-aws-s3-bucket.git//. | 8a0b697adfbc673e6135c70246cff7f8052ad95a |

## Resources

| Name | Type |
|------|------|
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.s3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_iam_policy_role"></a> [iam\_policy\_role](#input\_iam\_policy\_role) | The bucket for hosting static | <pre>object({<br>    create                        = optional(bool, true)<br>    path                          = optional(string, "/")<br>    policy_description            = optional(string, "")<br>    policy_name                   = optional(string, "")<br>    role_name                     = optional(string, "")<br>    role_permissions_boundary_arn = optional(string, null)<br>    oidc_providers                = optional(any, {})<br>    tags                          = optional(map(string), {})<br>  })</pre> | `{}` | no |
| <a name="input_s3_bucket"></a> [s3\_bucket](#input\_s3\_bucket) | The bucket for hosting static | <pre>object({<br>    create_bucket                              = optional(bool, true)<br>    attach_elb_log_delivery_policy             = optional(bool, false)<br>    attach_lb_log_delivery_policy              = optional(bool, false)<br>    attach_access_log_delivery_policy          = optional(bool, false)<br>    attach_deny_insecure_transport_policy      = optional(bool, false)<br>    attach_require_latest_tls_policy           = optional(bool, false)<br>    attach_policy                              = optional(bool, false)<br>    attach_public_policy                       = optional(bool, true)<br>    attach_inventory_destination_policy        = optional(bool, false)<br>    attach_analytics_destination_policy        = optional(bool, false)<br>    attach_deny_incorrect_encryption_headers   = optional(bool, false)<br>    attach_deny_incorrect_kms_key_sse          = optional(bool, false)<br>    allowed_kms_key_arn                        = optional(string, "")<br>    attach_deny_unencrypted_object_uploads     = optional(bool, false)<br>    bucket_name_suffix                         = optional(string, "grafana-tempo-data")<br>    bucket                                     = optional(string, "")<br>    bucket_prefix                              = optional(string, null)<br>    acl                                        = optional(string, null)<br>    policy                                     = optional(string, null)<br>    tags                                       = optional(map(string), {})<br>    force_destroy                              = optional(bool, false)<br>    acceleration_status                        = optional(string, null)<br>    request_payer                              = optional(string, null)<br>    website                                    = optional(any, {})<br>    cors_rule                                  = optional(any, [])<br>    versioning                                 = optional(map(string), {})<br>    logging                                    = optional(any, {})<br>    access_log_delivery_policy_source_buckets  = optional(list(string), [])<br>    access_log_delivery_policy_source_accounts = optional(list(string), [])<br>    grant                                      = optional(any, [])<br>    owner                                      = optional(map(string), {})<br>    expected_bucket_owner                      = optional(string, null)<br>    lifecycle_rule                             = optional(any, [])<br>    replication_configuration                  = optional(any, {})<br>    server_side_encryption_configuration       = optional(any, {})<br>    intelligent_tiering                        = optional(any, {})<br>    object_lock_configuration                  = optional(any, {})<br>    metric_configuration                       = optional(any, {})<br>    inventory_configuration                    = optional(any, {})<br>    inventory_source_account_id                = optional(string, null)<br>    inventory_source_bucket_arn                = optional(string, null)<br>    inventory_self_source_destination          = optional(bool, false)<br>    analytics_configuration                    = optional(any, {})<br>    analytics_source_account_id                = optional(string, null)<br>    analytics_source_bucket_arn                = optional(string, null)<br>    analytics_self_source_destination          = optional(bool, false)<br>    object_lock_enabled                        = optional(bool, false)<br>    block_public_acls                          = optional(bool, true)<br>    block_public_policy                        = optional(bool, true)<br>    ignore_public_acls                         = optional(bool, true)<br>    restrict_public_buckets                    = optional(bool, true)<br>    control_object_ownership                   = optional(bool, false)<br>    object_ownership                           = optional(string, "BucketOwnerEnforced")<br>    putin_khuylo                               = optional(bool, true)<br>  })</pre> | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_iam_policy_description"></a> [iam\_policy\_description](#output\_iam\_policy\_description) | The description of the policy |
| <a name="output_iam_policy_name"></a> [iam\_policy\_name](#output\_iam\_policy\_name) | The name of the policy |
| <a name="output_iam_policy_path"></a> [iam\_policy\_path](#output\_iam\_policy\_path) | The path of the policy in IAM |
| <a name="output_iam_policy_policy"></a> [iam\_policy\_policy](#output\_iam\_policy\_policy) | The policy document |
| <a name="output_iam_role_arn"></a> [iam\_role\_arn](#output\_iam\_role\_arn) | ARN of IAM role |
| <a name="output_iam_role_name"></a> [iam\_role\_name](#output\_iam\_role\_name) | Name of IAM role |
| <a name="output_iam_role_path"></a> [iam\_role\_path](#output\_iam\_role\_path) | Path of IAM role |
| <a name="output_iam_role_unique_id"></a> [iam\_role\_unique\_id](#output\_iam\_role\_unique\_id) | Unique ID of IAM role |
| <a name="output_s3_bucket_arn"></a> [s3\_bucket\_arn](#output\_s3\_bucket\_arn) | The ARN of the bucket. Will be of format arn:aws:s3:::bucketname. |
| <a name="output_s3_bucket_bucket_domain_name"></a> [s3\_bucket\_bucket\_domain\_name](#output\_s3\_bucket\_bucket\_domain\_name) | The bucket domain name. Will be of format bucketname.s3.amazonaws.com. |
| <a name="output_s3_bucket_bucket_regional_domain_name"></a> [s3\_bucket\_bucket\_regional\_domain\_name](#output\_s3\_bucket\_bucket\_regional\_domain\_name) | The bucket region-specific domain name. The bucket domain name including the region name, please refer here for format. Note: The AWS CloudFront allows specifying S3 region-specific endpoint when creating S3 origin, it will prevent redirect issues from CloudFront to S3 Origin URL. |
| <a name="output_s3_bucket_hosted_zone_id"></a> [s3\_bucket\_hosted\_zone\_id](#output\_s3\_bucket\_hosted\_zone\_id) | The Route 53 Hosted Zone ID for this bucket's region. |
| <a name="output_s3_bucket_id"></a> [s3\_bucket\_id](#output\_s3\_bucket\_id) | The name of the bucket. |
| <a name="output_s3_bucket_lifecycle_configuration_rules"></a> [s3\_bucket\_lifecycle\_configuration\_rules](#output\_s3\_bucket\_lifecycle\_configuration\_rules) | The lifecycle rules of the bucket, if the bucket is configured with lifecycle rules. If not, this will be an empty string. |
| <a name="output_s3_bucket_policy"></a> [s3\_bucket\_policy](#output\_s3\_bucket\_policy) | The policy of the bucket, if the bucket is configured with a policy. If not, this will be an empty string. |
| <a name="output_s3_bucket_region"></a> [s3\_bucket\_region](#output\_s3\_bucket\_region) | The AWS region this bucket resides in. |
| <a name="output_s3_bucket_website_domain"></a> [s3\_bucket\_website\_domain](#output\_s3\_bucket\_website\_domain) | The domain of the website endpoint, if the bucket is configured with a website. If not, this will be an empty string. This is used to create Route 53 alias records. |
| <a name="output_s3_bucket_website_endpoint"></a> [s3\_bucket\_website\_endpoint](#output\_s3\_bucket\_website\_endpoint) | The website endpoint, if the bucket is configured with a website. If not, this will be an empty string. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
