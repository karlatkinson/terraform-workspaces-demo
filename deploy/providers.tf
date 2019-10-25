provider "aws" {
  profile = "karlatkinson"
  assume_role {
    role_arn = var.workspace_iam_roles[terraform.workspace]
  }
  region = "eu-west-1"
}