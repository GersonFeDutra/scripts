#!/bin/bash

for file in "$PWD/"*.c; do
	[ -f "$file" ] || break
	file_no_extensions="`realpath \"$file\" --relative-to=\"$PWD\"`"

	# gcc -std=c11 -fPIC -c $file
	gcc -fPIC -c "$file" -o "${file_no_extensions%.*}.o"
	gcc $file -shared -o "${file_no_extensions%.*}.so"
done

rm *.o
