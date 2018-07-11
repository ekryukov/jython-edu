import requests
import sys

r = requests.get('https://ya.ru')

print "Get yandex home page"
print  r.status_code
