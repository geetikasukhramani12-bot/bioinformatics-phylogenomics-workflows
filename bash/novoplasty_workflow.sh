#!/bin/bash

# ============================================================
# NOVOPlasty Plastome Assembly Workflow
# ============================================================

# Create output directory
mkdir -p novoplasty_results

# Run NOVOPlasty using the configuration file
perl NOVOPlasty.pl -c config.txt

echo "NOVOPlasty plastome assembly completed."
