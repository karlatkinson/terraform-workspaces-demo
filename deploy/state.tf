terraform {
  backend "s3" {
    bucket  = "karls-terraform-state-bucket"
    key     = "terraform-workspace-demo/state.tfstate"
    region  = "eu-west-1"
    encrypt = true
    profile = "karlatkinson"
  }
}
