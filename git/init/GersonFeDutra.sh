#!/bin/bash
git init
git config user.name "GersonFeDutra"
git config user.email "gerson.creative.des@gmail.com"
echo -n "Insert SSH link: "
read link

# Redirect to correct ssh file
readarray -d '@' -t parsed_link<<<"$link"
to_origin="${parsed_link[0]}@private.${parsed_link[1]}"
echo -n "Redirect to: $to_origin"
git remote add origin "$to_origin"

git status
