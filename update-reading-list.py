#!/usr/bin/env python3

import requests
import json
from collections import defaultdict

READING_LABEL = "reading"


def map_issue(issue):
    return {
        "title": issue["title"],
        "body": issue["body"] or '',
        "reading": any((label["name"] == READING_LABEL for label in issue["labels"])),
    }


issues_url = "https://api.github.com/repos/bash/reading-list/issues"
issues_response = requests.get(issues_url, params={"author": "bash"})
issues_response.raise_for_status()
issues = sorted(
    (map_issue(issue) for issue in issues_response.json()),
    key=lambda i: i["reading"],
    reverse=True,
)

with open("content/reading-list.json", "w+") as f:
    json.dump(issues, f, indent=4)
