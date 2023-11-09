#!/usr/bin/python3
"""return subscribers"""
import requests


def recurse(subreddit, hot_list=[]):
    """return subscribers"""
    if not subreddit or not isinstance(subreddit, str):
        return None
    r = requests.get(
        'https://www.reddit.com/r/{}/hot.json'.format(subreddit),
        headers={'User-Agent': "omar"})
    if r.status_code == 200:
        data = r.json()["data"]
        try:
            hot_list.append(data["children"][len(hot_list)]['data']['title'])
        except Exception:
            return hot_list
        return recurse(subreddit, hot_list)
    return None
