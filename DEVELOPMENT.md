# Development Guide

This guide covers the development workflow, tools, and best practices for contributing to this terraform modules repository.

## Prerequisites

### Required Tools

* **Terraform**: Latest stable version (1.5.0+)
* **Git**: For version control
* **Python**: For pre-commit hooks (3.8+)

### Optional Tools

* **tfsec**: Security scanning
* **tflint**: Terraform linting
* **terraform-docs**: Documentation generation

## Setup

### 1. Clone the Repository

```bash
git clone https://github.com/robolague/terraform-modules.git
cd terraform-modules
```

### 2. Install Pre-commit Hooks

```bash
# Run the automated setup script
./scripts/setup-pre-commit.sh

# Or install manually
pip install pre-commit
pre-commit install
```

## Development Workflow

### 1. Create a Feature Branch

```bash
git checkout -b feature/your-module-name
```

### 2. Make Changes

Follow these guidelines:

* **Use conventional commits**: See the [Semantic Versioning](#semantic-versioning) section in README.md
* **Follow module structure**: See module standards below
* **Write documentation**: Include README.md for each module
* **Test locally**: Validate your Terraform code

### 3. Pre-commit Checks

Before committing, ensure all checks pass:

```bash
# Run all pre-commit hooks
pre-commit run --all-files

# Or run specific hooks
pre-commit run terraform_fmt
pre-commit run terraform_validate
pre-commit run terraform_tflint
pre-commit run terraform_docs
pre-commit run tfsec
```

### 4. Documentation Generation

Documentation is automatically generated by pre-commit hooks, but you can also run it manually:

```bash
# Generate docs for a specific module
terraform-docs markdown modules/your-module/

# Or run via pre-commit
pre-commit run terraform_docs
```

### 5. Commit Changes

```bash
# Use conventional commit format
git commit -m "feat(aws-vpc): add support for custom CIDR blocks"

# Or use the template
git commit
```

### 6. Push and Create PR

```bash
git push origin feature/your-module-name
```

Then create a Pull Request on GitHub.

## Module Development

### Module Structure

Each module should follow this structure:

```
modules/your-module/
├── main.tf           # Main module configuration
├── variables.tf      # Input variables
├── outputs.tf        # Output values
├── versions.tf       # Terraform and provider versions
├── README.md         # Auto-generated module documentation
└── examples/         # Usage examples
    ├── basic/
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    └── advanced/
        ├── main.tf
        ├── variables.tf
        └── outputs.tf
```

### Module Standards

1. **Naming Convention**
   * Use kebab-case for module names
   * Use descriptive, clear names
   * Include cloud provider prefix (aws-, azure-, gcp-)

2. **Documentation**
   * README.md is auto-generated by terraform-docs
   * Include usage examples
   * Document security considerations

3. **Code Quality**
   * Consistent formatting (enforced by pre-commit)
   * Proper variable validation
   * Security best practices
   * Resource tagging

4. **Testing**
   * Local validation
   * Security scanning with tfsec
   * Documentation generation

### Example Module

```hcl
# modules/aws-vpc/main.tf
terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

resource "aws_vpc" "main" {
  cidr_block           = var.cidr_block
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support

  tags = merge(var.tags, {
    Name = var.name
  })
}
```

## Pre-commit Hooks

### Available Hooks

| Hook | Purpose | Runs On |
|------|---------|---------|
| `terraform_fmt` | Format Terraform files | `.tf` files |
| `terraform_validate` | Validate Terraform syntax | `.tf` files |
| `terraform_docs` | Generate documentation | `.tf` files |
| `terraform_tflint` | Lint Terraform code | `.tf` files |
| `tfsec` | Security scanning | `.tf` files |
| `trailing-whitespace` | Remove trailing spaces | All files |
| `end-of-file-fixer` | Ensure files end with newline | All files |
| `check-yaml` | Validate YAML syntax | `.yml`, `.yaml` files |
| `prettier` | Format YAML files | `.yml`, `.yaml` files |
| `markdownlint` | Lint Markdown files | `.md` files |

### Hook Configuration

Hooks are configured in `.pre-commit-config.yaml`:

```yaml
# Example: Customize Terraform formatting
- id: terraform_fmt
  args:
    - --args=-no-color
    - --args=-diff
    - --args=-write=true
```

### Troubleshooting Hooks

1. **Hook Fails**: Check the error message and fix the issue
2. **False Positive**: Add exclusions in configuration files
3. **Performance**: Hooks run only on changed files by default
4. **Skip Hooks**: Use `git commit --no-verify` (not recommended)

## Security Scanning

### Local Security Checks

```bash
# Run tfsec locally
tfsec .

# Run tflint locally
tflint
```

### Security Configuration

* `.tfsec.yml`: tfsec configuration (if needed)
* GitHub Actions: Automated security scanning with tfsec and CodeQL

## Testing

### Local Testing

```bash
# Validate a specific module
cd modules/your-module
terraform init
terraform validate
terraform plan

# Test examples
cd examples/basic
terraform init
terraform plan
```

### Automated Testing

* **GitHub Actions**: Runs on every PR
* **Pre-commit**: Runs before each commit
* **Security Scanning**: Automated vulnerability detection with tfsec and CodeQL

## Documentation

### Writing Documentation

1. **README.md**: Auto-generated by terraform-docs
2. **Examples**: Working usage examples
3. **Comments**: Inline code documentation
4. **Security Notes**: Security considerations

### Documentation Standards

* Use clear, concise language
* Include code examples
* Document all variables and outputs
* Explain security implications
* Provide migration guides for breaking changes

## Release Process

### Semantic Versioning

This repository uses [techpivot/terraform-module-releaser](https://github.com/techpivot/terraform-module-releaser) for automated semantic versioning.

* **Major**: Breaking changes (use `!` in commit message)
* **Minor**: New features (`feat:` commits)
* **Patch**: Bug fixes (`fix:` commits)

### Release Workflow

1. **Development**: Work on feature branches
2. **PR**: Create pull request with conventional commits
3. **Review**: Code review and testing
4. **Merge**: Merge to main branch
5. **Release**: Automatic release creation (only on PR merges)

### Conventional Commits

Use the conventional commit format:

```
<type>(<scope>): <subject>
```

**Types:**

* `feat`: New features (minor version bump)
* `fix`: Bug fixes (patch version bump)
* `docs`: Documentation changes (no version bump)
* `style`: Code style changes (no version bump)
* `refactor`: Code refactoring (no version bump)
* `test`: Adding or updating tests (no version bump)
* `chore`: Maintenance tasks (no version bump)

**Breaking Changes:**

```
feat(aws-vpc)!: change default CIDR block
```

## Best Practices

### Code Quality

* Use consistent naming conventions
* Follow Terraform best practices
* Implement proper error handling
* Use meaningful variable names
* Add comprehensive documentation

### Security

* Follow security best practices
* Use least privilege principles
* Implement proper encryption
* Validate all inputs
* Regular security scanning with tfsec

### Performance

* Use data sources efficiently
* Minimize resource dependencies
* Optimize for parallel execution
* Use appropriate resource types

## Troubleshooting

### Common Issues

1. **Pre-commit Fails**
   * Check error messages
   * Fix formatting issues
   * Update dependencies

2. **Terraform Validation Errors**
   * Check syntax
   * Validate variable types
   * Ensure provider versions

3. **Security Scan Failures**
   * Review security issues
   * Implement fixes
   * Add exclusions if false positive

4. **Documentation Generation Issues**
   * Check terraform-docs syntax
   * Verify module structure
   * Review README.md template

### Getting Help

* Check existing documentation
* Review GitHub Issues
* Ask in discussions
* Follow security guidelines

## Resources

* [Terraform Documentation](https://www.terraform.io/docs)
* [Terraform Best Practices](https://www.terraform.io/docs/cloud/guides/recommended-practices/index.html)
* [tfsec Documentation](https://aquasecurity.github.io/tfsec/)
* [tflint Documentation](https://github.com/terraform-linters/tflint)
* [Pre-commit Documentation](https://pre-commit.com/)
* [Conventional Commits](https://www.conventionalcommits.org/)
* [terraform-docs Documentation](https://terraform-docs.io/)
