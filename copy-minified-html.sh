#!/bin/bash

# Source file path
source_file="index.min.html"

# Find all sub-directories within "record" directory
subdirectories=$(find record -type d)

# Copy source file to each sub-directory with renamed "index.html"
for dir in $subdirectories; do
  cp "$source_file" "$dir/index.html"
done
