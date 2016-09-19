#!/usr/bin/env python
"""
WORKS WITH PYTHON 2 OR 3
This is a demonstration of using a JSON API from the web, and using the
result. This one specifically gets a random catfact.
"""
import requests
import json
r = requests.get('http://catfacts-api.appspot.com/api/facts').content
#In Python 3, JSON won't process the bytes object the same way, so we call 
#   .decode('utf8')
catfact = json.loads(r.decode('utf8'))["facts"]
print(catfact[0])
