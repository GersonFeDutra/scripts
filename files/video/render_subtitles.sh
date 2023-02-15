#!/bin/bash

srt_file=$(basename "$2")
ass_file="${srt_file%.*}.ass"
ffmpeg -i "$2" ass_file
ffmpeg -i "$1" -vf ass=ass_file "$1-sub.mp4"

