variable "workspace_iam_roles" {
  default = {
    dev  = "arn:aws:iam::321338012591:role/deployment-role-dev"
    test = "arn:aws:iam::321338012591:role/deployment-role-test"
    prod = "arn:aws:iam::321338012591:role/deployment-role-prod"
  }
}


locals {
  instances = {
    "dev"  = "t3.micro"
    "test" = "t3.micro"
    "prod" = "t4.large"
  }
  instance_type = "${lookup(local.instances, terraform.workspace)}"
  tags = {
    "environment" = terraform.workspace
    "name"        = "terraform-workspace-demo"
    "owner"       = "karl atkinson"
    "team"        = "karls team"
  }
}