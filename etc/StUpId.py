#!/bin/env python3

import pyperclip
text: str = input('Insira a entrada!\n>>> ')
output: str = ""

for i in range(len(text)):
    if i % 2 == 0:
        output += text[i].upper()
    else:
        output += text[i].lower()

print(output)
pyperclip.copy(output)
print("\033[33mOutput pasted to clipboard!\033m")

