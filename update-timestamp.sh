#!/bin/bash
# Update build timestamp in index.html
# Usage: ./update-timestamp.sh

TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
VERSION=$(date -u +"%Y.%m.%d.%H:%M")

echo "Updating build timestamp to: $TIMESTAMP"

# Update meta tag
sed -i "s/<meta name=\"build-timestamp\" content=\".*\" \/>/<meta name=\"build-timestamp\" content=\"$TIMESTAMP\" \/>/" index.html

# Update visible timestamp
sed -i "s/v[0-9]\{4\}\.[0-9]\{2\}\.[0-9]\{2\}\.[0-9]\{2\}:[0-9]\{2\}/v$VERSION/" index.html

echo "✓ Build timestamp updated successfully!"
