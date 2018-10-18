#!/bin/bash
echo -e "\n[test] running sample of 20 requests with random useragent from same ip\n[expected result] distribution as configured in consul"
for x in {1..20}; do curl 127.0.0.1 -s -A "$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)"; done | sort | uniq -c

FIXED_USERAGENT="$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)"
echo -e "\n[test] running sample of 20 requests with fixed useragent from same ip\n[expected result] since useragent and ip did not change all requests go to one of the available groups"
for x in {1..20}; do curl 127.0.0.1 -s -A "$FIXED_USERAGENT"; done | sort | uniq -c

echo "" > cookies.txt
echo -e "\n[test] running sample of 20 requests with random useragent from same ip but remembering cookies\n[expected result] since the cookies will not be forgetten all requests go to one of the available groups"
for x in {1..20}; do curl 127.0.0.1 -b cookies.txt -c cookies.txt -s -A "$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)"; done | sort | uniq -c

echo -e "\n[test] running sample of 20 requests with random useragent from same ip but force group a via url parameter\n(this test will break when you change the url parameter name)\n[expected result] all requests go to group a as it is forced in the url"
for x in {1..20}; do curl 127.0.0.1?force_version=a -s -A "$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)"; done | sort | uniq -c

echo -e "\n[test] running sample of 20 requests with random useragent from same ip but force group b via url parameter\n(this test will break when you change the url parameter name)\n[expected result] all requests go to group b as it is forced in the url"
for x in {1..20}; do curl 127.0.0.1?force_version=b -s -A "$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)"; done | sort | uniq -c
