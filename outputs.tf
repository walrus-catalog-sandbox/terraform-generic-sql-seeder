output "context" {
  description = "The input context, a map, which is used for orchestration."
  value       = var.context
}

output "selector" {
  description = "The selector, a map, which is used for dependencies or collaborations."
  value       = []
}

output "id" {
  description = "The execution ID of the byteset pipeline."
  value       = byteset_pipeline.seeding.id
}

output "timecost" {
  description = "The execution timecost of the byteset pipeline."
  value       = byteset_pipeline.seeding.cost
}
