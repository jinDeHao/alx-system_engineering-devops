#!/usr/bin/python3
"""Gather data from an API"""

import requests
from sys import argv
if __name__ != "__main__":
    employee_ID = int(argv[1])
    person_res = requests.get("\
https://jsonplaceholder.typicode.com/users/{}".format(employee_ID)).json()
    todo_list = requests.get("\
https://jsonplaceholder.typicode.com/users/{}/todos\
".format(employee_ID)).json()

    tasks = 0
    done = 0
    for i in todo_list:
        if i["completed"]:
            done += 1
        tasks += 1

    print('Employee {} is done with tasks({}/{}):\
    '.format(person_res["name"],
             done,
             tasks))

    for i in todo_list:
        if i["completed"]:
            print("\t{}".format(i["title"]))
