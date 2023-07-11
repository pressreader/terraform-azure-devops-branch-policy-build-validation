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

variable "match_type" {
  description = "The match type to use when applying the policy. Supported values are Exact (default), Prefix or DefaultBranch."
  type        = string
  default     = "Exact"

  validation {
    condition     = contains(["Exact", "Prefix", "DefaultBranch"], var.match_type)
    error_message = "The match_type value must be one of Exact, Prefix or DefaultBranch."
  }
}

variable "repository_id" {
  description = "The repository ID. Needed only if the scope of the policy will be limited to a single repository. If match_type is DefaultBranch, this should not be defined."
  type        = string
}

variable "repository_ref" {
  description = "The ref pattern to use for the match when match_type other than DefaultBranch. If match_type is Exact, this should be a qualified ref such as refs/heads/master. If match_type is Prefix, this should be a ref path such as refs/heads/releases."
  type        = string
}