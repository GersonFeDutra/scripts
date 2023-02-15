#!/usr/bin/env bash
mkdir clones
for file in *; do
	cat "$file" >> "clones/$file"
done
