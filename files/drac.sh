#!/bin/bash
victims=$(sudo docker ps -aq)
for victim in $victims; do
	echo "removing $victim"
	sudo docker rm $victim
done
exit 0
