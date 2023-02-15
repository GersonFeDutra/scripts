#!/bin/bash
for i do
	ebook-convert "$i" "${file%.*}.mobi"
done

