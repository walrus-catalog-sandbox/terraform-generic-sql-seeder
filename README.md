# Generic SQL Seeder

Terraform module which seeds Relational Database for Development or Testing, like MySQL, PostgreSQL, MariaDB, etc., powered by [Seal/Byteset](https://registry.terraform.io/providers/seal-io/byteset/latest).

## Usage

```hcl
module "sql-seeder" {
  source = "..."

  src  = "https://raw.githubusercontent.com/seal-io/terraform-provider-byteset/main/byteset/testdata/mysql-lg.sql"
  dest = "mysql://username:password@tcp(ip:port)/"
}
```

## Examples

- [MySQL](./examples/mysql)
- [PostgreSQL](./examples/postgresql)

## Contributing

Please read our [contributing guide](./docs/CONTRIBUTING.md) if you're interested in contributing to Walrus template.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_byteset"></a> [byteset](#requirement\_byteset) | >= 0.2.3 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_byteset"></a> [byteset](#provider\_byteset) | >= 0.2.3 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [byteset_pipeline.seeding](https://registry.terraform.io/providers/seal-io/byteset/latest/docs/resources/pipeline) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_context"></a> [context](#input\_context) | Receive contextual information. When Walrus deploys, Walrus will inject specific contextual information into this field.<br><br>Examples:<pre>context:<br>  project:<br>    name: string<br>    id: string<br>  environment:<br>    name: string<br>    id: string<br>  resource:<br>    name: string<br>    id: string</pre> | `map(any)` | `{}` | no |
| <a name="input_dest"></a> [dest](#input\_dest) | Specify the seeding destiantion address, which is a database connection string.<br><br>Example:<pre>mysql://[username:[password]@]tcp([address][:port])[/dbname][?param1=value1&...]<br>maria|mariadb://[username:[password]@]tcp([address][:port])[/dbname][?param1=value1&...]<br>postgres|postgresql://[username:[password]@][address][:port][/dbname][?param1=value1&...]<br>oracle://[username:[password]@][address][:port][/service][?param1=value1&...]<br>mssql|sqlserver://[username:[password]@][address][:port][/instance][?database=dbname&param1=value1&...]</pre> | `string` | n/a | yes |
| <a name="input_execution_batch_capacity"></a> [execution\_batch\_capacity](#input\_execution\_batch\_capacity) | Specify the batch capacity value during executing. | `number` | `500` | no |
| <a name="input_execution_maximum_connection"></a> [execution\_maximum\_connection](#input\_execution\_maximum\_connection) | Specify the maximum connection value during executing. | `number` | `5` | no |
| <a name="input_salt"></a> [salt](#input\_salt) | Specify the salt for triggering a new seeding. | `string` | `null` | no |
| <a name="input_src"></a> [src](#input\_src) | Specify the seeding source address started with 'file://' or 'http(s)://' schema.<br><br>Example:<pre>https://raw.githubusercontent.com/seal-io/terraform-provider-byteset/main/byteset/testdata/mysql.sql</pre> | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_context"></a> [context](#output\_context) | The input context, a map, which is used for orchestration. |
| <a name="output_id"></a> [id](#output\_id) | The execution ID of the byteset pipeline. |
| <a name="output_refer"></a> [refer](#output\_refer) | The refer, a map, which is used for dependencies or collaborations. |
| <a name="output_timecost"></a> [timecost](#output\_timecost) | The execution timecost of the byteset pipeline. |
<!-- END_TF_DOCS -->

## License

Copyright (c) 2023 [Seal, Inc.](https://seal.io)

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at [LICENSE](./LICENSE) file for details.

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
