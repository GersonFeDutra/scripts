#!/bin/env python3
import datetime
# from sys import argv
from sys import stdin

#if __name__ != '__main__':
#    exit()

#timeList = argv[1:]

# for i in timeList:
#     (h, m, s) = i.split(':')
#     d = datetime.timedelta(hours=int(h), minutes=int(m), seconds=int(s))
# mysum += d

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

