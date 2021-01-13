# VCS-GitLab

Terraform config to help with testing GitLab VCS Provider.

## Setup

```
# Copy .envrc.example and set the values
cp .envrc.example .envrc

# 'direnv allow' if you use direnv or just source the file with 'source .envrc'
direnv allow
  OR
source .envrc

# terraform init and plan
terraform init && terraform plan

# terraform apply to create the TFC resources on staging
terraform apply
```