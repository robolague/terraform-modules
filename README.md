# Terraform Modules

This repository contains reusable Terraform modules for infrastructure management.

## Structure

```
terraform-modules/
├── modules/          # Reusable Terraform modules
└── .github/         # GitHub Actions workflows
```

## Available Modules

Modules are organized in the `modules/` directory. Each module should include:

- `main.tf` - Main module configuration
- `variables.tf` - Input variables
- `outputs.tf` - Output values
- `README.md` - Module documentation
- `versions.tf` - Terraform and provider version constraints

## Usage

To use a module from this repository:

```hcl
module "example" {
  source = "github.com/your-username/terraform-modules//modules/example"
  
  # Module variables
  variable_name = "value"
}
```

## Development

### Adding a New Module

1. Create a new directory in `modules/`
2. Add the required Terraform files
3. Document the module in its README.md
4. Test the module locally
5. Submit a pull request

### Module Standards

- Use semantic versioning for releases
- Include comprehensive documentation
- Provide examples in the README
- Use consistent variable naming
- Include proper validation rules

## Semantic Versioning

This repository uses semantic versioning for automated releases. See [SEMANTIC_VERSIONING.md](SEMANTIC_VERSIONING.md) for detailed information.

### Quick Start

1. Use conventional commit messages (see `.gitmessage` template)
2. Create pull requests to main branch
3. Automatic releases are created on merge

### Commit Message Format

```
<type>(<scope>): <subject>

feat(aws-vpc): add support for custom CIDR blocks
fix(azure-storage): resolve naming conflict
docs: update README with examples
```

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes using conventional commits
4. Test thoroughly
5. Submit a pull request

## License

[Add your chosen license here] 