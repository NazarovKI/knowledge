#!/bin/bash
cd content/daily || exit

for file in *.md; do
    # Проверяем, есть ли frontmatter
    if head -n1 "$file" | grep -q '^---'; then
        # Извлекаем имя файла без расширения
        name=$(basename "$file" .md)
        # Проверяем, есть ли уже строка date:
        if ! grep -q '^date:' "$file"; then
            # Вставляем date после первой строки ---
            sed -i "0,/^---/s/^---/---\ndate: $name/" "$file"
        fi
    fi
done
