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