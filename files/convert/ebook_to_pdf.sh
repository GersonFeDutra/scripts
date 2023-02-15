#!/bin/bash
for i do
	ebook-convert "$i" "${file%.*}.pdf"
done

