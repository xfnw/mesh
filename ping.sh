#!/bin/bash

source config.sh





peers="$(sort realpeers.txt | uniq | awk '{if($1!="FORWARD"){print $1}}' | tr '\n' ',')"


for fn in "$(awk '{print $1}' peers.txt)"; do


		url="$fn"
		echo "pinging $url"
		curl -m 1 -L -A "xfnwmesh/1.0" -F "callback=$callback" -F "peers=$peers" "$url" >/dev/null 2>/dev/null && echo "$url" >> realpeers.txt


done

sort peers.txt | uniq > peers.txt.m
tee peers.txt <peers.txt.m > /dev/null

sort realpeers.txt | uniq > realpeers.txt.m
tee realpeers.txt <realpeers.txt.m > /dev/null

rm realpeers.txt.m peers.txt.m

