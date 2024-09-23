data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

data "aws_iam_policy_document" "s3" {
  statement {
    actions = [
      "s3:PutObject",
      "s3:GetObject",
      "s3:DeleteObject",
      "s3:GetObjectTagging",
      "s3:PutObjectTagging"
    ]
    resources = ["${module.s3_bucket.s3_bucket_arn}/*"]
  }
  statement {
    actions = [
      "s3:ListBucket"
    ]
    resources = [module.s3_bucket.s3_bucket_arn]
  }

}
