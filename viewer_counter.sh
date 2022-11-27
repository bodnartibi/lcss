#!/bin/bash

if [ -z $1 ]; then
	echo "Give me a channel ID" 
	exit 1
fi

CID="${1}"

SEARCH_EXP="/GET \/${CID}\/[0-9]+\.ts/ {print \$7}"

LAST_BUT_ONE=$(tail -n 150 /var/log/nginx/access.log | awk "${SEARCH_EXP}" | sort | uniq | tail -n 2 | head -n 1)

VIEW_COUNT=$(tail -n 150 /var/log/nginx/access.log | grep "$LAST_BUT_ONE" | wc -l)

echo "{\"channelID\" : $CID , \"count\": $VIEW_COUNT }" | jq .
