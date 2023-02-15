#!/bin/bash

if [[ $1 ]]; then
	youtube-dl --get-duration "https://www.youtube.com/playlist?list=$1" | $(dirname $0)/time_sum.py
fi

