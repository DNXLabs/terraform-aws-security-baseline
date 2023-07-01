terraform {
  backend "s3" {
    bucket         = "codepipeline-us-east-1-370051943281"
    key            = "my-terraform-state.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
}
