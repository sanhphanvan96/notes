#!/bin/bash

# Generate a tree structure while excluding certain folders and filtering for Markdown files
tree -I 'images|configs' -fi | grep '\.md$' > /tmp/md_files.txt

# Define the input and output files
input="/tmp/md_files.txt"
output="README.md"

# Start the README file with a header
echo "# Table of Contents" > "$output"
echo "" >> "$output"

# Process each line in the input file
while IFS= read -r filepath; do
  # Extract the filename and directory path
  filename=$(basename "$filepath")
  dirpath=$(dirname "$filepath")

  # Determine the depth of the file based on the directory structure
  depth=$(echo "$dirpath" | awk -F'/' '{print NF - 1}')

  # Generate the indentation for nested files (only if depth > 0)
  if [ $depth -eq 0 ]; then
    indent=""
  else
    indent=$(printf '    %.0s' $(seq 1 $depth))
  fi

  # Remove redundant "./" from the filepath
  clean_path=$(echo "$filepath" | sed 's|^\./||')

  # Create the Markdown link
  link="[$filename]($clean_path)"

  # Append the indented link to the output file
  echo "${indent}- $link" >> "$output"
done < "$input"

# Clean up temporary files
rm /tmp/md_files.txt

echo "README.md has been created."
