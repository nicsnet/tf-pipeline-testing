# variables.tf

variable "token" {
  description = "TFC Token"
}

variable "hostname" {
  description = "TFC Hostname"
}

variable "tfc_org" {
  description = "TFC Organization Name"
}

variable "repo_org" {
  description = "Repo org or user on GitLab"
}

variable "gitlab_oauth_token_id" {
  description = "GitLab oauth_token_id. Found in VCS Providers > GitLab > OAuth Token ID"
}

variable "github_oauth_token_id" {
  description = "GitHub oauth_token_id. Found in VCS Providers > GitHub > OAuth Token ID"
}
