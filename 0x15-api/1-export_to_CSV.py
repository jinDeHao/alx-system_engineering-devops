#!/usr/bin/python3
"""Gather data from an API"""

import csv
import requests
from sys import argv

if __name__ == "__main__":
    employee_ID = int(argv[1])
    person = requests.get("\
https://jsonplaceholder.typicode.com/users/{}".format(employee_ID)).json()
    todo_list = requests.get("\
https://jsonplaceholder.typicode.com/users/{}/todos\
".format(employee_ID)).json()

    with open('{}.csv'.format(employee_ID), 'w') as file:
        writer = csv.writer(file, quoting=csv.QUOTE_NONNUMERIC)
        for i in todo_list:
            writer.writerow([str(employee_ID), person["username"],
                             str(i["completed"]),
                             i["title"]])
