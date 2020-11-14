#!/bin/bash

source config.sh





peers="$(sort realpeers.txt | uniq | awk '{if($1!="FORWARD"){print $1}}' | tr '\n' ',')"


for fn in "$(sort peers.txt | uniq)"; do


		url=$(echo "$fn" | awk '{print $1}')

		curl -m 1 -L -A "xfnwmesh/1.0" -F "callback=$callback" -F "peers=$peers" $url >/dev/null 2>/dev/null && echo "$url" >> realpeers.txt


done



