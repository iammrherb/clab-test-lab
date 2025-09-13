#!/bin/bash
# Destroy script for test-lab
set -e

echo "Destroying test-lab lab..."

# Find .clab.yml file
CLAB_FILE=$(find . -name "*.clab.yml" -type f | head -1)

if [ -z "$CLAB_FILE" ]; then
    echo "No .clab.yml file found"
    exit 1
fi

# Destroy the lab
containerlab destroy --topo "$CLAB_FILE"

echo "Lab destroyed successfully!"
