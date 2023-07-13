resource "azuredevops_branch_policy_build_validation" "main" {
  enabled    = var.enabled
  project_id = var.project_id

  settings {
    display_name        = var.name
    build_definition_id = var.build_definition_id
    valid_duration      = var.valid_duration

    dynamic "scope" {
      for_each = {for v in var.scopes : "${v["repository_id"]} | ${v["repository_ref"]}" => v}

      content {
        match_type     = scope.value["match_type"]
        repository_id  = scope.value["repository_id"]
        repository_ref = scope.value["repository_ref"]
      }
    }
  }
}