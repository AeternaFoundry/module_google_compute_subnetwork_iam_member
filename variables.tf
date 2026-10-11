variable "compute_subnetwork_iam_members" {
  description = <<EOT
Map of compute_subnetwork_iam_members, attributes below
Required:
    - member
    - role
    - subnetwork
Optional:
    - project
    - region
    - condition (block):
        - description (optional)
        - expression (required)
        - title (required)
EOT

  type = map(object({
    member     = string
    role       = string
    subnetwork = string
    project    = optional(string)
    region     = optional(string)
    condition = optional(object({
      description = optional(string)
      expression  = string
      title       = string
    }))
  }))
}

