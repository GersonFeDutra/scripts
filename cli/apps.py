#!/bin/env python3
import ctypes
libC = ctypes.CDLL("./loader.so")

libC.load.argtypes = [ctypes.POINTER(ctypes.c_char_p), ctypes.c_int]
libC.load.restype = ctypes.c_int

print('Select an app:')
APPS: tuple = 'htop',

values_type = ctypes.c_char_p * len(APPS)
values = values_type()

for i, app in enumerate(APPS):
    print(f'{i} - {app}')
    values[i] = ctypes.c_char_p(app.encode('utf-8'))


print('\033[32m>>> \033[m', end='', flush=True)
exit(libC.load(values, len(APPS)))
