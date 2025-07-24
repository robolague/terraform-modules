#!/bin/bash

# Setup script for pre-commit hooks
# This script installs pre-commit and sets up the hooks

set -e

echo "🚀 Setting up pre-commit hooks..."

# Check if pre-commit is installed
if ! command -v pre-commit &> /dev/null; then
    echo "📦 Installing pre-commit..."

    # Try different installation methods
    if command -v pip &> /dev/null; then
        pip install pre-commit
    elif command -v pip3 &> /dev/null; then
        pip3 install pre-commit
    elif command -v brew &> /dev/null; then
        brew install pre-commit
    else
        echo "❌ Error: Could not install pre-commit. Please install it manually:"
        echo "   pip install pre-commit"
        echo "   or"
        echo "   brew install pre-commit"
        exit 1
    fi
else
    echo "✅ pre-commit is already installed"
fi

# Install the pre-commit hooks
echo "🔧 Installing pre-commit hooks..."
pre-commit install

# Install additional dependencies for Terraform hooks
echo "📦 Installing Terraform dependencies..."

# Check if Terraform is installed
if ! command -v terraform &> /dev/null; then
    echo "⚠️  Warning: Terraform is not installed. Some hooks may fail."
    echo "   Please install Terraform: https://www.terraform.io/downloads.html"
fi

# Check if tfsec is installed
if ! command -v tfsec &> /dev/null; then
    echo "📦 Installing tfsec..."
    if command -v brew &> /dev/null; then
        brew install tfsec
    else
        echo "⚠️  Warning: Could not install tfsec automatically."
        echo "   Please install it manually: https://aquasecurity.github.io/tfsec/"
    fi
fi



# Check if terraform-docs is installed
if ! command -v terraform-docs &> /dev/null; then
    echo "📦 Installing terraform-docs..."
    if command -v brew &> /dev/null; then
        brew install terraform-docs
    else
        echo "⚠️  Warning: Could not install terraform-docs automatically."
        echo "   Please install it manually: https://terraform-docs.io/user-guide/installation/"
    fi
fi

# Run pre-commit on all files to ensure everything is set up
echo "🔍 Running pre-commit on all files..."
pre-commit run --all-files

echo "✅ Pre-commit setup complete!"
echo ""
echo "📋 Available hooks:"
echo "   - terraform_fmt: Format Terraform files"
echo "   - terraform_validate: Validate Terraform syntax"
echo "   - terraform_docs: Generate documentation"
echo "   - tfsec: Security scanning with tfsec"
echo "   - General code quality checks (whitespace, file endings, etc.)"
echo "   - YAML formatting with prettier"
echo "   - Markdown linting"
echo ""
echo "📚 Documentation generation:"
echo "   - ./scripts/generate-docs.sh: Generate docs for all modules"
echo ""
echo "💡 Usage:"
echo "   - Hooks run automatically on commit"
echo "   - Run manually: pre-commit run"
echo "   - Run on specific file: pre-commit run --files file.tf"
echo "   - Skip hooks: git commit --no-verify"
