# require.tf

terraform {
  required_providers {
    tfe = "~> 0.22.0"
  }
}

provider "tfe" {
  hostname = var.hostname
  token    = var.token
}
