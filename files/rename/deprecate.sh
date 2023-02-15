#!/bin/bash

for file in .[!.]* *
do
	echo "$file + .old"
	mv "$file" "$file.old"
done

