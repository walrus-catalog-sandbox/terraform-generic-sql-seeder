terraform {
  required_version = ">= 1.0"

  required_providers {
    byteset = {
      source  = "seal-io/byteset"
      version = ">= 0.2.3"
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
  name         = "mysql:8.0"
  keep_locally = true
}

resource "docker_container" "example" {
  name  = "mysql"
  image = docker_image.example.image_id
  env = [
    "MYSQL_ROOT_PASSWORD=password",
  ]
  ports {
    internal = 3306
    external = 3306
  }
}

module "this" {
  source = "../.."

  src  = "https://raw.githubusercontent.com/seal-io/terraform-provider-byteset/main/byteset/testdata/mysql-lg.sql"
  dest = "mysql://root:password@tcp(localhost:3306)/"
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
