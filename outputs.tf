#
# Orchestration
#

output "context" {
  description = "The input context, a map, which is used for orchestration."
  value       = var.context
}

output "refer" {
  description = "The refer, a map, which is used for dependencies or collaborations."
  sensitive   = true
  value = {
    schema = "generic:sql:seeder"
    params = {
      selector = {}
      id       = byteset_pipeline.seeding.id
    }
  }
}

#
# Reference
#

output "id" {
  description = "The execution ID of the byteset pipeline."
  value       = byteset_pipeline.seeding.id
}

output "timecost" {
  description = "The execution timecost of the byteset pipeline."
  value       = byteset_pipeline.seeding.cost
}
