# Development Guide

This guide covers the development workflow, tools, and best practices for contributing to this terraform modules repository.

## Prerequisites

### Required Tools

- **Terraform**: Latest stable version (1.5.0+)
- **Git**: For version control
- **Python**: For pre-commit hooks (3.8+)
- **Node.js**: For semantic release (18+)

### Optional Tools

- **tfsec**: Security scanning
- **tflint**: Terraform linting
- **checkov**: Additional security scanning

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

### 3. Install Dependencies

```bash
# Install Node.js dependencies for semantic release
npm install
```

## Development Workflow

### 1. Create a Feature Branch

```bash
git checkout -b feature/your-module-name
```

### 2. Make Changes

Follow these guidelines:

- **Use conventional commits**: See [SEMANTIC_VERSIONING.md](SEMANTIC_VERSIONING.md)
- **Follow module structure**: See module standards below
- **Write documentation**: Include README.md for each module
- **Test locally**: Validate your Terraform code

### 3. Pre-commit Checks

Before committing, ensure all checks pass:

```bash
# Run all pre-commit hooks
pre-commit run --all-files

# Or run specific hooks
pre-commit run terraform_fmt
pre-commit run terraform_validate
pre-commit run terraform_tfsec
```

### 4. Commit Changes

```bash
# Use conventional commit format
git commit -m "feat(aws-vpc): add support for custom CIDR blocks"

# Or use the template
git commit
```

### 5. Push and Create PR

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
├── README.md         # Module documentation
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
   - Use kebab-case for module names
   - Use descriptive, clear names
   - Include cloud provider prefix (aws-, azure-, gcp-)

2. **Documentation**
   - Comprehensive README.md
   - Usage examples
   - Input/output documentation
   - Security considerations

3. **Code Quality**
   - Consistent formatting
   - Proper variable validation
   - Security best practices
   - Resource tagging

4. **Testing**
   - Local validation
   - Security scanning
   - Documentation generation

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
| `terraform_checkov` | Security scanning | `.tf` files |
| `terraform_tfsec` | Security scanning | `.tf` files |
| `trailing-whitespace` | Remove trailing spaces | All files |
| `end-of-file-fixer` | Ensure files end with newline | All files |
| `check-yaml` | Validate YAML syntax | `.yml`, `.yaml` files |
| `check-json` | Validate JSON syntax | `.json` files |
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

# Run checkov locally
checkov -d . --framework terraform

# Run tflint locally
tflint
```

### Security Configuration

- `.tfsec.yml`: tfsec configuration
- `SECURITY.md`: Security documentation
- GitHub Actions: Automated security scanning

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

- **GitHub Actions**: Runs on every PR
- **Pre-commit**: Runs before each commit
- **Security Scanning**: Automated vulnerability detection

## Documentation

### Writing Documentation

1. **README.md**: Comprehensive module documentation
2. **Examples**: Working usage examples
3. **Comments**: Inline code documentation
4. **Security Notes**: Security considerations

### Documentation Standards

- Use clear, concise language
- Include code examples
- Document all variables and outputs
- Explain security implications
- Provide migration guides for breaking changes

## Release Process

### Semantic Versioning

- **Major**: Breaking changes
- **Minor**: New features
- **Patch**: Bug fixes

### Release Workflow

1. **Development**: Work on feature branches
2. **PR**: Create pull request with conventional commits
3. **Review**: Code review and testing
4. **Merge**: Merge to main branch
5. **Release**: Automatic release creation

### Manual Release

```bash
# Create a release manually
npm run semantic-release
```

## Best Practices

### Code Quality

- Use consistent naming conventions
- Follow Terraform best practices
- Implement proper error handling
- Use meaningful variable names
- Add comprehensive documentation

### Security

- Follow security best practices
- Use least privilege principles
- Implement proper encryption
- Validate all inputs
- Regular security scanning

### Performance

- Use data sources efficiently
- Minimize resource dependencies
- Optimize for parallel execution
- Use appropriate resource types

## Troubleshooting

### Common Issues

1. **Pre-commit Fails**
   - Check error messages
   - Fix formatting issues
   - Update dependencies

2. **Terraform Validation Errors**
   - Check syntax
   - Validate variable types
   - Ensure provider versions

3. **Security Scan Failures**
   - Review security issues
   - Implement fixes
   - Add exclusions if false positive

### Getting Help

- Check existing documentation
- Review GitHub Issues
- Ask in discussions
- Follow security guidelines

## Resources

- [Terraform Documentation](https://www.terraform.io/docs)
- [Terraform Best Practices](https://www.terraform.io/docs/cloud/guides/recommended-practices/index.html)
- [tfsec Documentation](https://aquasecurity.github.io/tfsec/)
- [Pre-commit Documentation](https://pre-commit.com/)
- [Conventional Commits](https://www.conventionalcommits.org/) 