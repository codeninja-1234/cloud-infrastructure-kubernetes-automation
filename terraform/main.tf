# Cost-conscious starter IaC example.
# This creates a tagged S3 bucket only; it does not create a Kubernetes cluster.
# Extend this file only after reviewing AWS costs and permissions.

resource "aws_s3_bucket" "artifacts" {
  bucket_prefix = "${var.project_name}-artifacts-"
  force_destroy = true

  tags = {
    Project = var.project_name
    Managed = "terraform"
  }
}
