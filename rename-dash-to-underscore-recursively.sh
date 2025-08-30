#!/usr/bin/env bash
# Recursively rename all directories with '-' in the name to use '_'.

set -euo pipefail

root="${1:-.}"

echo "Scanning $root for dash-named folders…"

# Find deepest dirs first (-depth), then rename safely
find "$root" -depth -type d -name '*-*' | while IFS= read -r dir; do
  base="$(basename "$dir")"
  underscored="${base//-/_}"   # replace all dashes with underscores
  if [[ "$base" != "$underscored" ]]; then
    parent="$(dirname "$dir")"
    new="$parent/$underscored"
    if [[ -e "$new" ]]; then
      echo "⚠️ Target exists, skipping: $new"
    else
      echo "➜ Renaming: $dir -> $new"
      mv "$dir" "$new"
    fi
  fi
done

echo "Done renaming."