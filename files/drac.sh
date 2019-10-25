#!/bin/bash
# Docker Remove All Containers

app='echo'
while getopts x arg; do
	case $arg in
		x) app='';;
		*) echo 'Bad arg - bye'; exit 42;;
	esac
done

victims=$(sudo docker ps -aq)
for victim in $victims; do
	$app sudo docker rm $victim
done
exit 0
