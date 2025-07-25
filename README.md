# Terraform Modules

[![Terraform Module Releaser](https://github.com/robolague/terraform-modules/workflows/Terraform%20Module%20Releaser/badge.svg)](https://github.com/robolague/terraform-modules/actions)
[![CodeQL](https://github.com/robolague/terraform-modules/workflows/CodeQL/badge.svg)](https://github.com/robolague/terraform-modules/actions)

This repository contains reusable Terraform modules for infrastructure management.

## Structure

```
terraform-modules/
├── modules/          # Reusable Terraform modules
│   ├── aws-vpc/     # AWS VPC module (example)
│   └── ...          # Additional modules
├── templates/        # Documentation templates
├── scripts/          # Development and automation scripts
├── .github/          # GitHub Actions workflows
└── examples/         # Usage examples
```

## Available Modules

### AWS Modules

| Module | Description | Latest Version |
|--------|-------------|----------------|
| [aws-vpc](modules/aws-vpc) | AWS VPC with optional Internet Gateway | [v1.0.0](https://github.com/robolague/terraform-modules/releases/latest) |

### Module Structure

Each module includes:

* `main.tf` - Main module configuration
* `variables.tf` - Input variables with validation
* `outputs.tf` - Output values
* `README.md` - Auto-generated documentation
* `examples/` - Usage examples
* `versions.tf` - Terraform and provider version constraints

### Adding New Modules

To add a new module:

1. Create a new directory in `modules/`
2. Follow the module structure above
3. Include comprehensive examples
4. Ensure all tests pass
5. Submit a pull request

The module will be automatically documented and released with the next semantic version bump.

## Usage

This repository uses semantic versioning for releases. To use a module from this repository, specify the version:

### Using Latest Release

```hcl
module "vpc" {
  source = "github.com/robolague/terraform-modules//modules/aws-vpc?ref=v1.0.0"

  name       = "my-vpc"
  cidr_block = "10.0.0.0/16"

  tags = {
    Environment = "production"
    Project     = "my-project"
  }
}
```

### Using Specific Branch (Development)

```hcl
module "vpc" {
  source = "github.com/robolague/terraform-modules//modules/aws-vpc?ref=main"

  name       = "my-vpc"
  cidr_block = "10.0.0.0/16"
}
```

### Available Versions

Check the [releases page](https://github.com/robolague/terraform-modules/releases) for available versions.

**Note**: Always pin to a specific version in production environments to ensure consistency and avoid unexpected changes.

## Development

### Release Process

This repository uses automated semantic versioning:

1. **Development**: Work on feature branches
2. **Pull Request**: Create PR with conventional commits
3. **Review**: Code review and automated testing
4. **Merge**: Merge to main branch
5. **Release**: Automatic version bump and GitHub release

### Module Standards

* ✅ **Semantic Versioning**: Automated releases using techpivot/terraform-module-releaser
* ✅ **Auto-Documentation**: README files generated automatically
* ✅ **Security Scanning**: tfsec and CodeQL analysis
* ✅ **Code Quality**: Pre-commit hooks for formatting and validation
* ✅ **Examples**: Comprehensive usage examples
* ✅ **Validation**: Input validation and error handling
* ✅ **Testing**: Automated testing on every PR

### Security Scanning

This repository uses tfsec for automated security scanning:

* **Automated Checks**: Runs on every PR and push to main
* **Security Issues**: Identifies potential security vulnerabilities
* **Compliance**: Ensures AWS/Azure/GCP security best practices
* **Configuration**: Customizable via `.tfsec.yml`

Common security checks include:

* Encryption at rest and in transit
* IAM permissions and policies
* Network security groups and firewalls
* Resource access controls
* Compliance with security standards

### Pre-commit Hooks

Local development is enhanced with pre-commit hooks that run before each commit:

#### Setup

```bash
# Run the setup script
./scripts/setup-pre-commit.sh

# Or install manually
pip install pre-commit
pre-commit install
```

#### Available Hooks

* **Terraform Formatting**: `terraform fmt` on all `.tf` files
* **Terraform Validation**: Syntax and configuration validation
* **Documentation Generation**: Auto-generate module documentation
* **Security Scanning**: tfsec and Checkov security checks
* **Code Quality**: General linting and formatting
* **Markdown Linting**: Documentation formatting

#### Usage

```bash
# Run all hooks on staged files (automatic on commit)
pre-commit run

# Run on all files
pre-commit run --all-files

# Run specific hook
pre-commit run terraform_fmt

# Skip hooks (not recommended)
git commit --no-verify
```

## Semantic Versioning

This repository uses automated semantic versioning based on conventional commit messages. The [techpivot/terraform-module-releaser](https://github.com/techpivot/terraform-module-releaser) action handles versioning automatically.

### Commit Message Format

All commits should follow the conventional commit format:

```
<type>(<scope>): <subject>
```

### Commit Types

* **feat**: New features (triggers minor version bump)
* **fix**: Bug fixes (triggers patch version bump)
* **docs**: Documentation changes (no version bump)
* **style**: Code style changes (no version bump)
* **refactor**: Code refactoring (no version bump)
* **test**: Adding or updating tests (no version bump)
* **chore**: Maintenance tasks (no version bump)
* **perf**: Performance improvements (triggers patch version bump)

### Breaking Changes

To indicate a breaking change, add `!` after the type/scope:

```
feat(aws-vpc)!: change default CIDR block
```

### Examples

```
feat(aws-vpc): add support for custom CIDR blocks
fix(azure-storage): resolve storage account naming conflict
docs: update module usage examples
feat(aws-ec2)!: change default instance type
```

### Version Bumping Rules

* **MAJOR** (1.0.0): Breaking changes
* **MINOR** (1.1.0): New features (backward compatible)
* **PATCH** (1.1.1): Bug fixes (backward compatible)

### Git Template Setup

To use the commit message template:

```bash
git config commit.template .gitmessage
```

### Quick Start

1. Use conventional commit messages (see `.gitmessage` template)
2. Create pull requests to main branch
3. Automatic releases are created when PR is merged
4. **Important**: Releases only happen on PR merges, not direct pushes to main

## Contributing

### Quick Start

1. **Fork** the repository
2. **Clone** your fork locally
3. **Setup** development environment:

   ```bash
   ./scripts/setup-pre-commit.sh
   ```

4. **Create** a feature branch
5. **Make changes** using conventional commits
6. **Test** thoroughly (hooks run automatically)
7. **Submit** a pull request

### Automated Features

This repository includes several automated features:

* 🔄 **Auto-Documentation**: README files generated from code
* 🛡️ **Security Scanning**: tfsec and Checkov on every commit
* 📝 **Code Formatting**: Terraform and Markdown formatting
* 🏷️ **Semantic Releases**: Automatic versioning and releases
* ✅ **Quality Checks**: Pre-commit hooks for consistency

### Development Workflow

See [DEVELOPMENT.md](DEVELOPMENT.md) for detailed development guidelines.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
