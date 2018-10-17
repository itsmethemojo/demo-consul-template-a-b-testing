#!/bin/bash
echo "running sample of 20 requests with random useragent from same ip"
for x in {1..20}; do curl 127.0.0.1 -s -A $(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1); done | sort | uniq -c

echo "running sample of 20 requests with fixed useragent from same ip"
for x in {1..20}; do curl 127.0.0.1 -s -A "fixed-user-agent"; done | sort | uniq -c

echo "" > cookies.txt
echo "running sample of 20 requests with random useragent from same ip but remembering cookies"
for x in {1..20}; do curl 127.0.0.1 -b cookies.txt -c cookies.txt -s -A $(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1); done | sort | uniq -c
