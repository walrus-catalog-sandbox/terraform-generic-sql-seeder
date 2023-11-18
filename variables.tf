#
# Contextual Fields
#

variable "context" {
  description = <<-EOF
Receive contextual information. When Walrus deploys, Walrus will inject specific contextual information into this field.

Examples:
```
context:
  project:
    name: string
    id: string
  environment:
    name: string
    id: string
  resource:
    name: string
    id: string
```
EOF
  type        = map(any)
  default     = {}
}

#
# Deployment Fields
#

variable "src" {
  description = <<-EOF
Specify the seeding source address started with 'file://' or 'http(s)://' schema.

Example:
```
https://raw.githubusercontent.com/seal-io/terraform-provider-byteset/main/byteset/testdata/mysql.sql
```
EOF
  type        = string
  validation {
    condition     = can(regex("^(?:(https|http|file)://)+(?:[^/.\\s]+\\.)*", var.src))
    error_message = "Invalid source address"
  }
}

variable "dest" {
  description = <<-EOF
Specify the seeding destiantion address, which is a database connection string.

Example:
```
mysql://[username:[password]@]tcp([address][:port])[/dbname][?param1=value1&...]
maria|mariadb://[username:[password]@]tcp([address][:port])[/dbname][?param1=value1&...]
postgres|postgresql://[username:[password]@][address][:port][/dbname][?param1=value1&...]
oracle://[username:[password]@][address][:port][/service][?param1=value1&...]
mssql|sqlserver://[username:[password]@][address][:port][/instance][?database=dbname&param1=value1&...]
```
EOF
  type        = string
}

variable "execution_maximum_connection" {
  description = <<-EOF
Specify the maximum connection value during executing.
EOF
  type        = number
  default     = 5
  validation {
    condition     = var.execution_maximum_connection > 0
    error_message = "Invalid execution maximum connection value"
  }
}

variable "execution_batch_capacity" {
  description = <<-EOF
Specify the batch capacity value during executing.
EOF
  type        = number
  default     = 500
  validation {
    condition     = var.execution_batch_capacity > 0
    error_message = "Invalid execution batch capacity value"
  }
}

variable "salt" {
  description = <<-EOF
Specify the salt for triggering a new seeding.
EOF
  type        = string
  default     = null
}
