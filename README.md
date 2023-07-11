# Azure DevOps Branch Policy Build Validation Terraform module

Terraform module which creates Branch Policy Build Validation in Azure DevOps

## Usage

```terraform
module "branch_policy_build_validation" {
  source = "git::https://github.com/pressreader/terraform-azure-devops-branch-policy-build-validation.git?ref=v1.0.0"

  enabled = True # Defaults to True

  project_id     = "ID of a project"
  repository_id  = "ID of a repository"
  repository_ref = "Name of the repository branch"

  name                = "Name of a branch policy"
  build_definition_id = "ID of a build definition"

  valid_duration = 720     # Defaults to 720
  match_type     = "Exact" # Defaults to Exact
}
```