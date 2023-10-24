#!/usr/bin/python3
"""Gather data from an API"""

import json
import requests
from sys import argv

if __name__ == "__main__":
    persons = requests.get("\
https://jsonplaceholder.typicode.com/users/").json()

    with open('todo_all_employees.json', 'w') as file:
        disctionary = {}
        for person in persons:
            todo_list = requests.get("\
https://jsonplaceholder.typicode.com/users/{}/todos\
".format(person["id"])).json()
            if "{}".format(person["id"]) not in disctionary:
                disctionary["{}".format(person["id"])] = []
            user = disctionary["{}".format(person["id"])]
            for i in todo_list:
                user.append({"username": person["username"],
                             "task": i["title"],
                            "completed": i["completed"]})
        json.dump(disctionary, file)
