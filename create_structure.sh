#!/bin/bash

# This script creates a directory structure and files for a fictional character hierarchy.
# The directories and files are created based on the arrays `directories` and `files`.
# The root directory can be specified as an argument when running the script.
# If no argument is provided, the current directory is used as the root.

# Check if a root directory is specified as an argument
# If not, use the current directory as the root
root_dir="${1:-.}"

# Define the directory structure
# Each element in the `directories` array represents a directory path
directories=(
    "$root_dir/personnages/mascottes"
    "$root_dir/personnages/super heros/femmes/cape"
    "$root_dir/personnages/super heros/femmes/sans cape"
    "$root_dir/personnages/super heros/hommes/cape"
    "$root_dir/personnages/super heros/hommes/sans cape"
    "$root_dir/personnages/super heros/femmes/cape/batgirl"
    "$root_dir/personnages/super heros/femmes/cape/wonderwoman"
    "$root_dir/personnages/super heros/femmes/sans cape/electra"
    "$root_dir/personnages/super heros/femmes/sans cape/superwoman"
)

# Define the files to be created
# Each element in the `files` array represents a file path
files=(
    "$root_dir/personnages/mascottes/beastie"
    "$root_dir/personnages/mascottes/bibendum"
    "$root_dir/personnages/mascottes/mario"
    "$root_dir/personnages/mascottes/sonic"
    "$root_dir/personnages/super heros/hommes/cape/batman"
    "$root_dir/personnages/super heros/hommes/cape/superman"
    "$root_dir/personnages/super heros/hommes/cape/thor"
    "$root_dir/personnages/super heros/hommes/sans cape/antman"
    "$root_dir/personnages/super heros/hommes/sans cape/daredevil"
    "$root_dir/personnages/super heros/hommes/sans cape/linuxman"
    "$root_dir/personnages/super heros/hommes/sans cape/spiderman"
)

# Create directories
# For each directory in the `directories` array, create the directory with permissions set to 775
for dir in "${directories[@]}"; do
    mkdir -m 775 -p "$dir"
done

# Create files
# For each file in the `files` array, create the file with permissions set to 664
# If the `file` variable is empty, print an error message and skip the file creation
for file in "${files[@]}"; do
    if [[ -n "$file" ]]; then
        echo "Creating file: $file"  # Log the file being created
        touch "$file"
        chmod 664 "$file"  # Change permissions to 664
    else
        echo "Error: file variable is empty"
    fi
done

# Display the permissions of the created directories and files using the `ls` command
ls -lR --color=auto "$root_dir/personnages"

