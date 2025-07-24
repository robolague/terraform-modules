# Semantic Versioning Guide

This repository uses semantic versioning to automatically manage releases based on conventional commit messages.

## How It Works

### Commit Message Format

All commits should follow the conventional commit format:

```
<type>(<scope>): <subject>

<body>

<footer>
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
* **ci**: CI/CD changes (no version bump)
* **build**: Build system changes (no version bump)
* **revert**: Reverting previous commits (no version bump)

### Breaking Changes

To indicate a breaking change, add `!` after the type/scope:

```
feat(aws-vpc)!: change default CIDR block
```

Or include in the footer:

```
feat(aws-vpc): add new variable

BREAKING CHANGE: The default CIDR block has changed from 10.0.0.0/16 to 172.16.0.0/16
```

## Examples

### Feature Addition

```
feat(aws-ec2): add support for custom AMI selection
```

### Bug Fix

```
fix(azure-storage): resolve storage account naming conflict
```

### Breaking Change

```
feat(aws-vpc)!: change default subnet configuration

BREAKING CHANGE: Default subnet CIDR blocks have been updated
```

### Documentation Update

```
docs: update module usage examples
```

## Version Bumping Rules

* **MAJOR** (1.0.0): Breaking changes
* **MINOR** (1.1.0): New features (backward compatible)
* **PATCH** (1.1.1): Bug fixes (backward compatible)

## Workflow

1. **Development**: Work on feature branches
2. **Commits**: Use conventional commit messages
3. **Pull Request**: Create PR to main branch
4. **Merge**: When PR is merged, semantic-release runs
5. **Release**: Automatic version bump and GitHub release

## Configuration Files

* `.gitmessage`: Git commit message template
* `.github/workflows/semantic-release.yml`: GitHub Actions workflow (pure bash)

## Setting Up Git Template

To use the commit message template:

```bash
git config commit.template .gitmessage
```

## Manual Release

If you need to create a manual release, you can trigger the GitHub Actions workflow manually or use the GitHub CLI:

```bash
gh workflow run semantic-release.yml
```

## Troubleshooting

### Common Issues

1. **No release created**: Check commit message format
2. **Wrong version bump**: Verify commit type and breaking change indicators
3. **Workflow fails**: Check GitHub token permissions

### Debug Mode

The GitHub Actions workflow includes detailed logging. You can view the workflow logs in the GitHub Actions tab to debug any issues.

## Best Practices

1. **Always use conventional commits**
2. **Test changes before merging**
3. **Document breaking changes clearly**
4. **Use descriptive commit messages**
5. **Reference issues in commit messages**

## Module-Specific Versioning

For individual modules, you can specify the scope:

```
feat(aws-vpc): add new subnet configuration
fix(azure-storage): resolve naming issue
docs(aws-ec2): update instance type documentation
```

This helps track which modules are affected by changes.
