resource "google_compute_subnetwork_iam_member" "compute_subnetwork_iam_members" {
  for_each = var.compute_subnetwork_iam_members

  member     = each.value.member
  role       = each.value.role
  subnetwork = each.value.subnetwork
  project    = each.value.project
  region     = each.value.region

  dynamic "condition" {
    for_each = each.value.condition != null ? [each.value.condition] : []
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }
}

