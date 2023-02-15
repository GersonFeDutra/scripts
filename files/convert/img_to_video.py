#!/usr/bin/python3
from sys import argv
from os import remove
from os.path import dirname, realpath, join
from subprocess import run

if __name__ == '__main__':
    mylist = 'mylist.txt'
    command = [join(dirname(realpath(__file__)), '_img_to_video.sh'), '-i', mylist]

    a = argv.index('-a')

    if a:
        audio = argv.pop(a + 1)
        command.extend(['-a', audio])
        argv.pop(a)
    try:
        remove(mylist)
    except OSError:
        pass

    with open(mylist, 'w+') as file:
        for arg in argv[1:]:
            print('file', arg, file=file)

    #run(['cat', mylist])
    run(command)

