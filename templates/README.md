# {{.Name}}

{{if .Description}}
{{.Description}}
{{end}}

## Requirements

| Name | Version |
|------|---------|
{{- range .Requirements}}
| {{.Name}} | {{.Version}} |
{{- end}}

## Providers

| Name | Version |
|------|---------|
{{- range .Providers}}
| {{.Name}} | {{.Version}} |
{{- end}}

## Resources

| Name | Type |
|------|------|
{{- range .Resources}}
| {{.Name}} | {{.Type}} |
{{- end}}

## Inputs

| Name | Description | Type | Required | Default |
|------|-------------|------|:--------:|:--------:|
{{- range .Inputs}}
| {{.Name}} | {{.Description}} | {{.Type}} | {{if .Required}}yes{{else}}no{{end}} | {{.Default}} |
{{- end}}

## Outputs

| Name | Description |
|------|-------------|
{{- range .Outputs}}
| {{.Name}} | {{.Description}} |
{{- end}}

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