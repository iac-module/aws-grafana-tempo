include {
  path = find_in_parent_folders()
}
iam_role = local.account_vars.iam_role

terraform {
  source = "git::https://github.com/iac-module/aws-grafana-tempo.git//?ref=v1.0.0"
}

locals {
  common_tags  = read_terragrunt_config(find_in_parent_folders("tags.hcl"))
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  region       = local.region_vars.locals.aws_region
  name         = basename(get_terragrunt_dir())
  parent       = basename(dirname(get_terragrunt_dir()))
}

dependency "eks" {
  config_path = find_in_parent_folders("eks/cluster-0001")
}

inputs = {
  iam_policy_role = {
    role_name                     = "${local.account_vars.locals.business_unit}-${local.account_vars.locals.env_name}-k8s-${local.parent}-${local.name}"
    policy_name                   = "${local.account_vars.locals.business_unit}-${local.account_vars.locals.env_name}-k8s-${local.parent}-${local.name}"
    role_permissions_boundary_arn = local.account_vars.locals.permissions_boundary

    oidc_providers = {
      eks = {
        provider_arn               = dependency.eks.outputs.oidc_provider_arn
        namespace_service_accounts = ["${local.parent}:${local.name}"]
      }
    }
    tags = local.common_tags.locals.common_tags
  }
  s3_buckets = {
    tags = local.common_tags.locals.common_tags
  }
}
