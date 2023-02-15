#!/bin/bash

for file in .[!.]* *
do
	if [[ "$file" == *".old" ]]; then
		echo "$file - .old"
		mv "$file" "${file%.old}"
	fi
done

