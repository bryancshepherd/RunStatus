
import Pastebin3
import sys
import urllib
print(sys.version)
print(urllib.version)
import importlib
from Pastebin3 import PastebinAPI

importlib.reload(Pastebin3)

results = []
with open('./user_info.txt') as inputfile:
    for line in inputfile:
        results.append(line.strip().split(','))

api_dk =
api_un =
api_up =

pb = PastebinAPI()
my_key = pb.generate_user_key(api_dev_key = api_dk, username = api_un, password = api_up)
print(my_key)
