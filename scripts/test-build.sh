#!/bin/bash

# Test script to validate the build output
# This ensures that npm run build creates all expected files

set -e

echo "Running build validation tests..."

# Clean up any existing dist directory
if [ -d "dist" ]; then
  rm -rf dist
  echo "✓ Cleaned up existing dist directory"
fi

# Run the build
echo "Building project..."
npm run build

# Check if dist directory was created
if [ ! -d "dist" ]; then
  echo "✗ FAIL: dist directory was not created"
  exit 1
fi
echo "✓ dist directory created"

# Check required files
REQUIRED_FILES=(
  "dist/index.html"
  "dist/logo.png"
  "dist/CNAME"
  "dist/vercel.json"
)

for file in "${REQUIRED_FILES[@]}"; do
  if [ ! -f "$file" ]; then
    echo "✗ FAIL: Required file $file is missing"
    exit 1
  fi
  echo "✓ $file exists"
done

# Check required directories
REQUIRED_DIRS=(
  "dist/assets"
  "dist/metadata"
)

for dir in "${REQUIRED_DIRS[@]}"; do
  if [ ! -d "$dir" ]; then
    echo "✗ FAIL: Required directory $dir is missing"
    exit 1
  fi
  echo "✓ $dir exists"
done

# Verify HTML file is not empty
if [ ! -s "dist/index.html" ]; then
  echo "✗ FAIL: index.html is empty"
  exit 1
fi
echo "✓ index.html is not empty"

# Check that .DS_Store files are not in dist
if find dist -name '.DS_Store' | grep -q .; then
  echo "✗ FAIL: Found .DS_Store files in dist directory"
  exit 1
fi
echo "✓ No .DS_Store files in dist directory"

echo ""
echo "✅ All build validation tests passed!"
exit 0
