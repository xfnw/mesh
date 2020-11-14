#!/bin/bash

callback=$1
peers=$2




for fn in "$(sort peers.txt | uniq)"; do


		url=$(echo "$fn" | awk '{print $1}')

		curl -m 1 -L -A "xfnwmesh/1.0" -F "callback=$callback" -F "peers=$peers" $url >/dev/null 2>/dev/null &


done



