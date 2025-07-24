#!/bin/bash

# Generate documentation for all Terraform modules
# This script uses terraform-docs to generate README files for all modules

set -e

echo "📚 Generating documentation for all Terraform modules..."

# Check if terraform-docs is installed
if ! command -v terraform-docs &> /dev/null; then
    echo "📦 Installing terraform-docs..."
    if command -v brew &> /dev/null; then
        brew install terraform-docs
    else
        echo "❌ Error: terraform-docs is not installed. Please install it manually:"
        echo "   brew install terraform-docs"
        echo "   or"
        echo "   https://terraform-docs.io/user-guide/installation/"
        exit 1
    fi
fi

# Find all Terraform modules
echo "🔍 Finding Terraform modules..."
modules=$(find . -name "*.tf" -exec dirname {} \; | sort -u | grep -E "(modules|examples)" | grep -v ".terraform")

if [ -z "$modules" ]; then
    echo "⚠️  No Terraform modules found."
    exit 0
fi

# Generate documentation for each module
for module in $modules; do
    if [ -f "$module/main.tf" ] || [ -f "$module/variables.tf" ]; then
        echo "📝 Generating documentation for: $module"
        
        # Generate README.md
        terraform-docs markdown \
            --sort-by=required \
            --output-file="$module/README.md" \
            --output-mode=replace \
            --hide-empty \
            "$module"
        
        echo "✅ Generated README.md for $module"
    fi
done

# Generate main repository documentation
echo "📝 Generating main repository documentation..."
if [ -f "main.tf" ] || [ -f "variables.tf" ]; then
    terraform-docs markdown \
        --sort-by=required \
        --output-file="README.md" \
        --output-mode=replace \
        --hide-empty \
        .
    
    echo "✅ Generated main README.md"
fi

echo "🎉 Documentation generation complete!"
echo ""
echo "📋 Generated documentation for:"
echo "$modules" | while read -r module; do
    if [ -f "$module/README.md" ]; then
        echo "   - $module/README.md"
    fi
done 