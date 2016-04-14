#!/usr/bin/python

import sys
import urllib
import re
import os
import importlib
import imp
util = imp.load_source('Pastebin3', '/Users/bryanshepherd/Projects/RunStatus/Pastebin3.py')
from Pastebin3 import PastebinAPI

results = []
with open('/Users/bryanshepherd/Projects/RunStatus/user_info.txt') as inputfile:
    for line in inputfile:
        results.append(line.strip().split(','))

api_dk = results[0][0]
api_un = results[1][0]
api_up = results[2][0]

pb = PastebinAPI()
my_key = pb.generate_user_key(api_dev_key = api_dk, username = api_un, password = api_up)
print(my_key)



pastes = pb.pastes_by_user(api_dev_key = api_dk, api_user_key = my_key.decode('utf-8'), results_limit = 1)

test = re.search('<paste_title>(?s)(.*)</paste_title>', 'asdf<paste_title>Hello7world</paste_title>asdf')
