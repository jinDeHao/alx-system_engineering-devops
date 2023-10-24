#!/usr/bin/python3
"""Gather data from an API"""

import json
import requests
from sys import argv

if __name__ == "__main__":
    employee_ID = int(argv[1])
    person = requests.get("\
https://jsonplaceholder.typicode.com/users/{}".format(employee_ID)).json()
    todo_list = requests.get("\
https://jsonplaceholder.typicode.com/users/{}/todos\
".format(employee_ID)).json()

    with open('{}.json'.format(employee_ID), 'w') as file:
        disctionary = {}
        disctionary["{}".format(employee_ID)] = []
        user = disctionary["{}".format(employee_ID)]
        for i in todo_list:
            user.append({"task": i["title"],
                         "completed": i["completed"],
                         "username": person["username"]})
        json.dump(disctionary, file)
