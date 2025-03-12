#!/bin/bash

# Absolute path to your PaintSHOP_pipeline repository
PIPELINE_ROOT="/Users/jbard/Library/CloudStorage/OneDrive-TexasA&MUniversity/repos/PaintSHOP_pipeline"

# Run the docker container:
# - Mount the whole repository at /app inside the container
# - Set the working directory to /app/example_run
# - Run the run_pipeline.sh script
docker run --rm \
    -v "${PIPELINE_ROOT}":/app \
    -w /app/example_run \
    -t paintshop_docker \
    bash run_pipeline.sh
