# Define AWS provider
provider "aws" {
  region = "us-west-2"  # Update with your desired region
}

terraform {
  cloud {
    organization = "lewis-sawe"

    workspaces {
      name = "k8sProject"
    }
  }
}







