#!/bin/bash
if [[ -f "$1" ]]; then
    ffmpeg -i "$1" -vf scale=720:1280:flags=neighbor scaledout.avi
else
    exit 1
fi
