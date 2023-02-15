#!/bin/env python3
import datetime
from sys import stdin

stream = stdin.read()
# print(stream)
timeList = stream.split('\n')
print(timeList)

mysum = datetime.timedelta()

for i in timeList:
    # print(i)
    try:
        (m, s) = i.split(':')
    except ValueError:
        continue
    d = datetime.timedelta(minutes=int(m), seconds=int(s))
    mysum += d
print(str(mysum))

