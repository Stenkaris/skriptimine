#!/bin/bash
# Küsime kasutajalt kataloogi nime
echo "Palun sisestage kataloogi nimi:"
read directory

# Kontrollime, kas kataloog eksisteerib üldse.
if [ ! -d "$directory" ]; then
    echo "Kataloog '$directory' ei eksisteeri."
    exit 1
fi
# Liigub kasutaja määratud kataloogi
cd "$directory"
# Iga uue käsu korral lähevad andmed tagasi nulli
file_count=0
dir_count=0
link_count=0
# Vaatab kõik kataloogid ja failid üle
for item in *; do
    if [ -L "$item" ]; then
        echo "$item - link"
        ((link_count++))
    elif [ -f "$item" ]; then
        echo "$item - file"
        ((file_count++))
    elif [ -d "$item" ]; then
        echo "$item - directory"
        ((dir_count++))
    else
        echo "$item - other"
    fi
done
#Arvutab kokku.
echo "Total files: $file_count"
echo "Total directories: $dir_count"
echo "Total links: $link_count"
