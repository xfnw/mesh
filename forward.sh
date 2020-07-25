#!/bin/bash

address=$1
reply=$2
peers=$3




for fn in "$(sort oldpeers.txt | uniq)"; do


		url=$(echo "$fn" | awk '{print $2}')

		curl -m 1 -L -A "xfnwmesh/1.0" -F "address=$address" -F "reply=$reply" -F "peers=$peers" $url >/dev/null 2>/dev/null &


done



