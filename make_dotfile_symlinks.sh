#!/bin/bash

# Get the absolute path of the directory where the script is being executed.
script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

# Set the path to the 'dotfiles' directory (can be changed).
dotfiles_dir="$script_dir/dotfiles"

# Get the list of files in the 'dotfiles' directory.
files_to_link=$(ls -A "$dotfiles_dir")

# Create symbolic links for files in the 'dotfiles' directory to the home directory.
for file in $files_to_link; do
  # Skip if the file or directory already exists in the home directory.
  if [[ -e "$HOME/$file" ]]; then
    echo "Skipping '$file': File already exists in the home directory."
    continue
  fi

  # Create a symbolic link.
  ln -s "$dotfiles_dir/$file" "$HOME/$file"
  echo "Created symlink for '$file'"
done

echo "Symlinks for dotfiles have been created!"
