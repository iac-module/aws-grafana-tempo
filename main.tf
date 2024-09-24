module "s3_bucket" {
  source                                     = "git::https://github.com/terraform-aws-modules/terraform-aws-s3-bucket.git//.?ref=8a0b697adfbc673e6135c70246cff7f8052ad95a" #v4.1.2
  attach_elb_log_delivery_policy             = var.s3_bucket.attach_elb_log_delivery_policy
  attach_lb_log_delivery_policy              = var.s3_bucket.attach_lb_log_delivery_policy
  attach_access_log_delivery_policy          = var.s3_bucket.attach_access_log_delivery_policy
  attach_deny_insecure_transport_policy      = var.s3_bucket.attach_deny_insecure_transport_policy
  attach_require_latest_tls_policy           = var.s3_bucket.attach_require_latest_tls_policy
  attach_policy                              = var.s3_bucket.attach_policy
  attach_public_policy                       = var.s3_bucket.attach_public_policy
  attach_inventory_destination_policy        = var.s3_bucket.attach_inventory_destination_policy
  attach_analytics_destination_policy        = var.s3_bucket.attach_analytics_destination_policy
  attach_deny_incorrect_encryption_headers   = var.s3_bucket.attach_deny_incorrect_encryption_headers
  attach_deny_incorrect_kms_key_sse          = var.s3_bucket.attach_deny_incorrect_kms_key_sse
  allowed_kms_key_arn                        = var.s3_bucket.allowed_kms_key_arn
  attach_deny_unencrypted_object_uploads     = var.s3_bucket.attach_deny_unencrypted_object_uploads
  bucket                                     = var.s3_bucket.bucket == "" ? "${data.aws_caller_identity.current.account_id}-${data.aws_region.current.name}-${var.s3_bucket.bucket_name_suffix}" : var.s3_bucket.bucket
  bucket_prefix                              = var.s3_bucket.bucket_prefix
  acl                                        = var.s3_bucket.acl
  policy                                     = var.s3_bucket.policy
  tags                                       = var.s3_bucket.tags
  force_destroy                              = var.s3_bucket.force_destroy
  acceleration_status                        = var.s3_bucket.acceleration_status
  request_payer                              = var.s3_bucket.request_payer
  website                                    = var.s3_bucket.website
  cors_rule                                  = var.s3_bucket.cors_rule
  versioning                                 = var.s3_bucket.versioning
  logging                                    = var.s3_bucket.logging
  access_log_delivery_policy_source_buckets  = var.s3_bucket.access_log_delivery_policy_source_buckets
  access_log_delivery_policy_source_accounts = var.s3_bucket.access_log_delivery_policy_source_accounts
  grant                                      = var.s3_bucket.grant
  owner                                      = var.s3_bucket.owner
  expected_bucket_owner                      = var.s3_bucket.expected_bucket_owner
  lifecycle_rule                             = var.s3_bucket.lifecycle_rule
  replication_configuration                  = var.s3_bucket.replication_configuration
  server_side_encryption_configuration       = var.s3_bucket.server_side_encryption_configuration
  intelligent_tiering                        = var.s3_bucket.intelligent_tiering
  object_lock_configuration                  = var.s3_bucket.object_lock_configuration
  metric_configuration                       = var.s3_bucket.metric_configuration
  inventory_configuration                    = var.s3_bucket.inventory_configuration
  inventory_source_account_id                = var.s3_bucket.inventory_source_account_id
  inventory_source_bucket_arn                = var.s3_bucket.inventory_source_bucket_arn
  inventory_self_source_destination          = var.s3_bucket.inventory_self_source_destination
  analytics_configuration                    = var.s3_bucket.analytics_configuration
  analytics_source_account_id                = var.s3_bucket.analytics_source_account_id
  analytics_source_bucket_arn                = var.s3_bucket.analytics_source_bucket_arn
  analytics_self_source_destination          = var.s3_bucket.analytics_self_source_destination
  object_lock_enabled                        = var.s3_bucket.object_lock_enabled
  block_public_acls                          = var.s3_bucket.block_public_acls
  block_public_policy                        = var.s3_bucket.block_public_policy
  ignore_public_acls                         = var.s3_bucket.ignore_public_acls
  restrict_public_buckets                    = var.s3_bucket.restrict_public_buckets
  control_object_ownership                   = var.s3_bucket.control_object_ownership
  object_ownership                           = var.s3_bucket.object_ownership
  putin_khuylo                               = var.s3_bucket.putin_khuylo
}

module "iam_s3_policy" {
  source = "git::https://github.com/terraform-aws-modules/terraform-aws-iam.git//modules/iam-policy?ref=89fe17a6549728f1dc7e7a8f7b707486dfb45d89" #v5.44.0
  count  = var.iam_policy_role.create ? 1 : 0

  name        = var.iam_policy_role.policy_name
  path        = var.iam_policy_role.path
  description = var.iam_policy_role.policy_description
  policy      = data.aws_iam_policy_document.s3.json
  tags        = var.iam_policy_role.tags
}

module "iam_eks_role" {
  source = "git::https://github.com/terraform-aws-modules/terraform-aws-iam.git//modules/iam-role-for-service-accounts-eks?ref=89fe17a6549728f1dc7e7a8f7b707486dfb45d89" #v5.44.0
  count  = var.iam_policy_role.create ? 1 : 0

  role_name                     = var.iam_policy_role.role_name
  create_role                   = true
  role_permissions_boundary_arn = var.iam_policy_role.role_permissions_boundary_arn
  oidc_providers                = var.iam_policy_role.oidc_providers
  role_policy_arns = {
    s3 = module.iam_s3_policy[0].arn
  }
  tags = var.iam_policy_role.tags
}
