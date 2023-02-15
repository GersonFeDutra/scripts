#!/bin/env python3

#def paste(str, p=True, c=True):
#    from subprocess import Popen, PIPE
#
#    if p:
#        p = Popen(['xsel', '-pi'], stdin=PIPE)
#        p.communicate(input=str)
#    if c:
#        p = Popen(['xsel', '-bi'], stdin=PIPE)
#        p.communicate(input=str)
import pyperclip

text = input('Insira a entrada!\n>>> ')
output = ""

for c in text:
    output += f"{c} "

output = output[0:-1]
print(output)
pyperclip.copy(output)
print("\033[35mOutput pasted to clipboard!\033[m")
