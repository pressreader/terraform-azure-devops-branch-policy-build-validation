variable "enabled" {
  description = "A flag indicating if the policy should be enabled. Defaults to true."
  type        = bool
  default     = true
}

variable "project_id" {
  description = "Azure DevOps Project ID"
  type        = string
}

variable "name" {
  description = "Name of the branch policy's build validation."
  type        = string
}

variable "build_definition_id" {
  description = "The ID of the build to monitor for the policy."
  type        = string
}

variable "valid_duration" {
  description = "The number of minutes for which the build is valid. If 0, the build will not expire. Defaults to 720 (12 hours)."
  type        = number
  default     = 720
}

variable "manual_queue_only" {
  description = "If set to true, the build will need to be manually queued. Defaults to false."
  type        = bool
  default     = false
}

variable "scopes" {
  description = <<EOF
  <br><b>match_type:</b> The match type to use when applying the policy. Supported values are Exact, Prefix or DefaultBranch. Defaults to Exact.
  <br><b>repository_id:</b> The repository ID. Needed only if the scope of the policy will be limited to a single repository. If match_type is DefaultBranch, this should not be defined.
  <br><b>repository_ref:</b> The ref pattern to use for the match when match_type other than DefaultBranch. If match_type is Exact, this should be a qualified ref such as refs/heads/master. If match_type is Prefix, this should be a ref path such as refs/heads/releases.
EOF
  type = list(object({
    match_type     = optional(string, "Exact")
    repository_id  = string
    repository_ref = string
  }))

  validation {
    condition     = alltrue([for v in var.scopes : contains(["Exact", "Prefix", "DefaultBranch"], v["match_type"])])
    error_message = "The match_type value must be one of Exact, Prefix or DefaultBranch."
  }
}

variable "filename_patterns" {
  description = "If a path filter is set, the policy will only apply when files which match the filter are changes. Not setting this field means that the policy will always apply. You can specify absolute paths and wildcards. Example: ['/WebApp/Models/Data.cs', '/WebApp/*', '*.cs']. Paths prefixed with '!' are excluded. Example: ['/WebApp/*', '!/WebApp/Tests/*']. Order is significant. Defaults to []."
  type        = list(string)
  default     = []
}