#!/bin/bash

_pwd=$(basename "$PWD")
_pwd="${_pwd}.txt"
echo "$_pwd"
echo ""

for file in *
do
	echo "$file" >> "$_pwd"
done

