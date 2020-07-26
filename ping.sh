#!/bin/bash

source config.sh

cp oldpeers.txt currentpeers.txt
cp peers.txt oldpeers.txt


printf '' > peers.txt


peers="$(sort oldpeers.txt | uniq | awk '{if($2!="FORWARD"){print $1}}' | tr '\n' ',')"


for fn in "$(sort oldpeers.txt | uniq)"; do


		url=$(echo "$fn" | awk '{print $2}')

		curl -m 1 -L -A "xfnwmesh/1.0" -F "address=$address" -F "reply=$reply" -F "peers=$peers" $url >/dev/null 2>/dev/null &


done



