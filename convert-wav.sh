#!/bin/bash

# Directory to search for .WAV files
search_directory='FTC-2023-COLOMBIA'

# Navigate to search directory
cd "$search_directory"

# Iterate over each .WAV file in the directory
for wav_file in *.WAV; do
    # Remove the .WAV extension to get the base name
    base_name=$(basename "$wav_file" .WAV)
    # Convert the base name to lower case
    lower_name=$(echo "$base_name" | tr '[:upper:]' '[:lower:]')

    # Create a new directory with the lower case name
    mkdir -p "$lower_name"

    # Convert the .WAV file to .mp3 and save it to the new directory
    ffmpeg -i "$wav_file" -ac 1 -ab 64k "${lower_name}/recording.mp3"

    # Copy the matching .vtt file to the new directory
    cp "${base_name}.vtt" "${lower_name}/transcript.vtt"
done
