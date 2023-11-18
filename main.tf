locals {
  project_name     = coalesce(try(var.context["project"]["name"], null), "default")
  environment_name = coalesce(try(var.context["environment"]["name"], null), "test")
  resource_name    = coalesce(try(var.context["resource"]["name"], null), "example")
}

#
# Deployment
#

resource "byteset_pipeline" "seeding" {
  source = {
    address = var.src
  }

  destination = {
    address   = var.dest
    conn_max  = var.execution_maximum_connection
    batch_cap = var.execution_batch_capacity
    salt      = join("-", [local.project_name, local.environment_name, local.resource_name, coalesce(var.salt, "default")])
  }
}
