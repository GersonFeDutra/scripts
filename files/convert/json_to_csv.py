#!/bin/env python3
import json
import csv
from sys import argv, exit, stderr, stdin, stdout
from os import path
from typing import Any
data: dict


def csv_out(buffer) -> None:
    spawn_writter = csv.writer(
        # buffer, delimiter=',', quoting=csv.QUOTE_ALL)
        buffer, delimiter=',', quotechar='"', quoting=csv.QUOTE_ALL)
        # buffer, delimiter=',', quotechar=';', quoting=csv.QUOTE_MINIMAL)

    def save(head: str, content: Any) -> None:
        spawn_writter.writerow((head, str(content).replace('\n', '\\n')))

    def save_list(head: str, content: list) -> None:
        for i, element in enumerate(content):
            spawn_writter.writerow((f'{head}_{i}', str(element).replace('\n', '\\n')))

    def save_dict(head: str, content: dict) -> None:
        for key, element in content.items():
            spawn_writter.writerow((f'{head}_{key}', str(element).replace('\n', '\\n')))

    for key, content in data.items():
        # stderr.write(f'{key = }, {content = }\n')
        {
            list: save_list,
            dict: save_dict,
        }.get(type(content), save)(key, content)


if __name__ == '__main__':

    if not stdin.isatty():
        stderr.write('Reading JSON file...\n')
        data = json.load(stdin)
        stderr.write(f'{data}\n')

        stderr.write('Writting CSV file...\n')
        csv_out(stdout)

    elif len(argv) == 1:
        print('No input file!')
        exit(1)

    for file_path in argv[1:]:
        basename: str = path.basename(file_path)
        name = path.splitext(basename)[0]
        name = f'{name}.csv'

        print('Reading JSON file...')
        with open(file_path, 'r') as jsonfile:
            data = json.load(jsonfile)
            print(data)

        print('Writting CSV file...')
        with open(name, 'w') as csvfile:
            csv_out(csvfile)
