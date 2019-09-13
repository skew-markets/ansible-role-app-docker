#!/bin/bash
# Docker Remove Dead Images
# Looks for docker images that have been superseded and tries to remove them.

app='echo'
while getopts x arg; do
	case $arg in
		x) app='';;
		*) echo 'Bad arg - bye'; exit 42;;
	esac
done

images=$(sudo docker images | grep '<none>' | awk '{print $3}' | egrep '[0-9a-z]{12,12}')
for image in $images; do
	$app sudo docker rmi $image
done
exit 0
