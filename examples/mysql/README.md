# MySQL Example

Seed MySQL by root module.

```bash
# setup infra
$ tf apply -auto-approve \
  -target=docker_image.example \
  -target=docker_container.example

# create service
$ tf apply -auto-approve
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_byteset"></a> [byteset](#requirement\_byteset) | >= 0.2.3 |
| <a name="requirement_docker"></a> [docker](#requirement\_docker) | 3.0.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_docker"></a> [docker](#provider\_docker) | 3.0.2 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_this"></a> [this](#module\_this) | ../.. | n/a |

## Resources

| Name | Type |
|------|------|
| [docker_container.example](https://registry.terraform.io/providers/kreuzwerker/docker/3.0.2/docs/resources/container) | resource |
| [docker_image.example](https://registry.terraform.io/providers/kreuzwerker/docker/3.0.2/docs/resources/image) | resource |

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_context"></a> [context](#output\_context) | n/a |
| <a name="output_id"></a> [id](#output\_id) | n/a |
| <a name="output_refer"></a> [refer](#output\_refer) | n/a |
| <a name="output_timecost"></a> [timecost](#output\_timecost) | n/a |
<!-- END_TF_DOCS -->
