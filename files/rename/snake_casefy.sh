#!/bin/bash

tmp="/tmp/snake_casefy"
if [ ! -d "$tmp" ]; then
    mkdir "$tmp"
fi
for file in *; do
    new=$(echo "$file" | sed --expression 's/\([A-Z]\)/_\L\1/g' --expression 's/^_//')
    echo "$new"
    mv "$file" "$tmp/$new"
    mv "$tmp/$new" ./"$new"
done
