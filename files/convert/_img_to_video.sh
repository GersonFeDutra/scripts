#!/bin/bash
list=mylist.txt
touch $list

function default() {
    for f in "$@"; do
        printf "file $f\n" >> "$list"
    done
    ffmpeg -f concat -i $list -c copy out.avi
}

while getopts ":i:a:" o; do
    case "${o}" in
        i) i=${OPTARG} ;;
        a) a=${OPTARG} ;;
        *) default ;;
    esac
done

if [ ! "$i" ]; then
    default
elif [ ! "$a" ]; then
    # Source: <https://trac.ffmpeg.org/wiki/Concatenate>
    ffmpeg -f concat -i $list -c copy out.avi
    #-filter_complex 'scale=1280:720'
else
    # Use audio file
    ffmpeg -f concat -i $list -c copy out.avi -i "$a"
fi
