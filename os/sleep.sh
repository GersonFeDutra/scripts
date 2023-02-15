#!/bin/bash
at=60;
if [ $# -eq 1 ]
then at=$1
fi
sudo shutdown -h +$at;
