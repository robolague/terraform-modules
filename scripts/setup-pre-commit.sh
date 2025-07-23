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

# Check if tflint is installed
if ! command -v tflint &> /dev/null; then
    echo "📦 Installing tflint..."
    if command -v brew &> /dev/null; then
        brew install tflint
    else
        echo "⚠️  Warning: Could not install tflint automatically."
        echo "   Please install it manually: https://github.com/terraform-linters/tflint"
    fi
fi

# Check if checkov is installed
if ! command -v checkov &> /dev/null; then
    echo "📦 Installing checkov..."
    if command -v pip &> /dev/null; then
        pip install checkov
    elif command -v pip3 &> /dev/null; then
        pip3 install checkov
    else
        echo "⚠️  Warning: Could not install checkov automatically."
        echo "   Please install it manually: https://www.checkov.io/"
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
echo "   - terraform_tflint: Lint Terraform code"
echo "   - terraform_checkov: Security scanning with Checkov"
echo "   - terraform_tfsec: Security scanning with tfsec"
echo "   - General code quality checks"
echo "   - YAML/JSON formatting"
echo "   - Markdown linting"
echo ""
echo "💡 Usage:"
echo "   - Hooks run automatically on commit"
echo "   - Run manually: pre-commit run"
echo "   - Run on specific file: pre-commit run --files file.tf"
echo "   - Skip hooks: git commit --no-verify" 