#!/bin/bash
# Launch script for test-lab
set -e

echo "Launching test-lab lab..."

# Find .clab.yml file
CLAB_FILE=$(find . -name "*.clab.yml" -type f | head -1)

if [ -z "$CLAB_FILE" ]; then
    echo "No .clab.yml file found"
    exit 1
fi

echo "Using topology file: $CLAB_FILE"

# Deploy the lab
containerlab deploy --topo "$CLAB_FILE"

echo "Lab deployed successfully!"
containerlab inspect --topo "$CLAB_FILE"
