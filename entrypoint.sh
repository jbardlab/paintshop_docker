#!/bin/bash
# Source the conda initialization script
source "${CONDA_DIR}/etc/profile.d/conda.sh"
# Activate the desired conda environment
conda activate paintshop
# Execute the command passed to the container
exec "$@"