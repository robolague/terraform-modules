<!-- BEGIN_TF_DOCS -->
# {{.Name}}

{{if .Description}}
{{.Description}}
{{end}}

{{if .Requirements}}
## Requirements

| Name | Version |
|------|---------|
{{- range .Requirements}}
| {{.Name}} | {{.Version}} |
{{- end}}
{{end}}

{{if .Providers}}
## Providers

| Name | Version |
|------|---------|
{{- range .Providers}}
| {{.Name}} | {{.Version}} |
{{- end}}
{{end}}

{{if .Modules}}
## Modules

| Name | Source | Version |
|------|--------|---------|
{{- range .Modules}}
| {{.Name}} | {{.Source}} | {{.Version}} |
{{- end}}
{{end}}

{{if .Resources}}
## Resources

| Name | Type |
|------|------|
{{- range .Resources}}
| {{.Name}} | {{.Type}} |
{{- end}}
{{end}}

{{if .Inputs}}
## Inputs

| Name | Description | Type | {{if .Inputs.Required}}Required{{else}}Optional{{end}} | Default |
|------|-------------|------|:--------:|:--------:|
{{- range .Inputs}}
| {{.Name}} | {{.Description}} | {{.Type}} | {{if .Required}}yes{{else}}no{{end}} | {{.Default}} |
{{- end}}
{{end}}

{{if .Outputs}}
## Outputs

| Name | Description |
|------|-------------|
{{- range .Outputs}}
| {{.Name}} | {{.Description}} |
{{- end}}
{{end}}

## Usage

```hcl
module "example" {
  source = "github.com/robolague/terraform-modules//modules/{{.Name}}"
  # Add your variables here
}
```

## Examples

See the [examples](./examples/) directory for complete usage examples.

## Security

This module follows security best practices:

- All resources are properly tagged
- Security groups follow least privilege principles
- Encryption is enabled by default where applicable
- IAM policies follow the principle of least privilege

## Contributing

Please read our [Contributing Guide](../../DEVELOPMENT.md) for details on our code of conduct and the process for submitting pull requests.

## License

This module is licensed under the MIT License. See the [LICENSE](../../LICENSE) file for details.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 5.0 |

## Resources

| Name | Type |
|------|------|
| [aws_default_route_table.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/default_route_table) | resource |
| [aws_internet_gateway.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_vpc.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cidr_block"></a> [cidr\_block](#input\_cidr\_block) | CIDR block for the VPC | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Name of the VPC | `string` | n/a | yes |
| <a name="input_create_internet_gateway"></a> [create\_internet\_gateway](#input\_create\_internet\_gateway) | Whether to create an Internet Gateway for the VPC | `bool` | `false` | no |
| <a name="input_enable_dns_hostnames"></a> [enable\_dns\_hostnames](#input\_enable\_dns\_hostnames) | Enable DNS hostnames in the VPC | `bool` | `true` | no |
| <a name="input_enable_dns_support"></a> [enable\_dns\_support](#input\_enable\_dns\_support) | Enable DNS support in the VPC | `bool` | `true` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to assign to the VPC | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_default_route_table_id"></a> [default\_route\_table\_id](#output\_default\_route\_table\_id) | The ID of the default route table |
| <a name="output_internet_gateway_arn"></a> [internet\_gateway\_arn](#output\_internet\_gateway\_arn) | The ARN of the Internet Gateway |
| <a name="output_internet_gateway_id"></a> [internet\_gateway\_id](#output\_internet\_gateway\_id) | The ID of the Internet Gateway |
| <a name="output_vpc_arn"></a> [vpc\_arn](#output\_vpc\_arn) | The ARN of the VPC |
| <a name="output_vpc_cidr_block"></a> [vpc\_cidr\_block](#output\_vpc\_cidr\_block) | The CIDR block of the VPC |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | The ID of the VPC |
<!-- END_TF_DOCS -->