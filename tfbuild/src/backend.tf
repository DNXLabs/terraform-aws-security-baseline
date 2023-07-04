terraform {
  backend "s3" {
    bucket         = "codepipeline-ap-southeast-1-753211148586"
    key            = "my-terraform-state.tfstate"
    region         = "ap-southeast-1"
    encrypt        = true
  }
}