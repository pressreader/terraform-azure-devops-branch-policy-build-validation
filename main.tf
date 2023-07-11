resource "azuredevops_branch_policy_build_validation" "main" {
  enabled    = var.enabled
  project_id = var.project_id

  settings {
    display_name        = var.name
    build_definition_id = var.build_definition_id
    valid_duration      = var.valid_duration

    scope {
      match_type     = var.match_type
      repository_id  = var.repository_id
      repository_ref = var.repository_ref
    }
  }
}