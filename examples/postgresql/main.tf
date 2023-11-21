terraform {
  required_version = ">= 1.0"

  required_providers {
    byteset = {
      source  = "seal-io/byteset"
      version = ">= 0.2.1"
    }
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}

provider "docker" {}

provider "byteset" {}

resource "docker_image" "example" {
  name         = "postgres:14.6"
  keep_locally = true
}

resource "docker_container" "example" {
  name  = "postgres"
  image = docker_image.example.image_id
  env = [
    "POSTGRES_PASSWORD=password",
    "POSTGRES_USER=root"
  ]
  ports {
    internal = 5432
    external = 5432
  }
}

module "this" {
  source = "../.."

  src  = "https://raw.githubusercontent.com/seal-io/terraform-provider-byteset/main/byteset/testdata/postgres-lg.sql"
  dest = "postgresql://root:password@localhost:5432?sslmode=disable"
}

output "context" {
  value = module.this.context
}

output "refer" {
  value = nonsensitive(module.this.refer)
}

output "id" {
  value = module.this.id
}

output "timecost" {
  value = module.this.timecost
}
