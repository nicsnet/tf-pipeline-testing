# # main.tf
#
locals {
  workspace_settings = {
     "track-master-branch" = {},
     "track-other-branch"  = {},
     "new-pr-status-check" = {}
  }
}

resource "tfe_workspace" "workspace" {
  for_each = local.workspace_settings

  name         = each.key
  organization = var.tfc_org
  auto_apply   = true
  vcs_repo {
    oauth_token_id = var.github_oauth_token_id
    identifier     = "${var.repo_org}/tfc-random"
  }
}

resource "tfe_workspace" "workspace-public-repo" {
   name         = "workspace-public-repo"
   organization = var.tfc_org
   auto_apply   = true
 }


resource "tfe_workspace" "workspace-github" {
  name         = "workspace-github"
  organization = var.tfc_org
  auto_apply   = true
  vcs_repo {
    oauth_token_id     = var.gitlab_oauth_token_id
    identifier         = "${var.repo_org}/terraform-randomness"
  }
}

resource "tfe_workspace" "workspace-submodule" {
  name         = "workspace-submodule-2"
  organization = var.tfc_org
  auto_apply   = true
  vcs_repo {
    oauth_token_id     = var.github_oauth_token_id
    identifier         = "${var.repo_org}/tfc-random"
    ingress_submodules = true
  }
}

# Policy Set
resource "tfe_policy_set" "test" {
  name          = "my-policy-set-2"
  description   = "A brand new policy set"
  organization  = var.tfc_org
  workspace_ids = ["${tfe_workspace.workspace-submodule.id}"]

  vcs_repo {
    identifier     = "${var.repo_org}/test-policy-set"
    oauth_token_id = var.gitlab_oauth_token_id
  }
}

#
locals {
   workspace_settings_monorepo = {
    "monorepo-api" = {
      working_dir = "/blossom",
      trigger     = ["/bubbles"]
    },
    "monorepo-application-api-2" = {
      working_dir = "/application",
      trigger     = ["/application"]
    },
    "monorepo-networking-api-2" = {
      working_dir = "/networking",
      trigger     = ["/networking"]
    }
  }
}

resource "tfe_workspace" "workspace-monorepos" {
  for_each = local.workspace_settings_monorepo

  name              = each.key
  working_directory = each.value.working_dir
  trigger_prefixes  = each.value.trigger
  organization      = var.tfc_org
  auto_apply        = true
  vcs_repo {
    oauth_token_id = var.github_oauth_token_id
    identifier     = "${var.repo_org}/tfc-random"
  }
}

# Registry Module
resource "tfe_registry_module" "test-registry-module" {
  vcs_repo {
    display_identifier = "${var.repo_org}/terraform-random-module"
    identifier         = "${var.repo_org}/terraform-random-module"
    oauth_token_id     = var.gitlab_oauth_token_id
  }
}

