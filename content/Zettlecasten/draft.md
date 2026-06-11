find . -type f -name "*.md" -exec sh -c '
  for file; do
    echo -e "---\ndraft: true\n---\n$(cat "$file")" > "$file"
  done
' sh {} +

