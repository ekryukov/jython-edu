#!/usr/bin/env bash


curl -o requests.tar.gz https://files.pythonhosted.org/packages/54/1f/782a5734931ddf2e1494e4cd615a51ff98e1879cbe9eecbdfeaf09aa75e9/requests-2.19.1.tar.gz
tar xzvf requests.tar.gz
rm requests.tar.gz
mv requests-2.19.1/requests ./
rm -rf requests-2.19.1

curl -o urllib3.tar.gz https://files.pythonhosted.org/packages/3c/d2/dc5471622bd200db1cd9319e02e71bc655e9ea27b8e0ce65fc69de0dac15/urllib3-1.23.tar.gz
tar xzvf urllib3.tar.gz
rm urllib3.tar.gz
mv urllib3-1.23/urllib3 ./
rm -rf urllib3-1.23

curl -o chardet.tar.gz https://files.pythonhosted.org/packages/fc/bb/a5768c230f9ddb03acc9ef3f0d4a3cf93462473795d18e9535498c8f929d/chardet-3.0.4.tar.gz
tar xzvf chardet.tar.gz
rm chardet.tar.gz
mv chardet-3.0.4/chardet ./
rm -rf chardet-3.0.4


curl -o certifi.tar.gz https://files.pythonhosted.org/packages/4d/9c/46e950a6f4d6b4be571ddcae21e7bc846fcbb88f1de3eff0f6dd0a6be55d/certifi-2018.4.16.tar.gz
tar xzvf certifi.tar.gz
rm certifi.tar.gz
mv certifi-2018.4.16/certifi ./
rm -rf certifi-2018.4.16

curl -o idna.tar.gz https://files.pythonhosted.org/packages/65/c4/80f97e9c9628f3cac9b98bfca0402ede54e0563b56482e3e6e45c43c4935/idna-2.7.tar.gz
tar xzvf idna.tar.gz
rm idna.tar.gz
mv idna-2.7/idna ./
rm -rf idna-2.7/idna ./


java ${JVM_ARGS} -cp ../lib/jython.jar -Dpython.cachedir.skip=false org.python.util.jython main.py "$@"
