#!/bin/bash

app='echo'
while getopts x arg; do
	case $arg in
		x) app='';;
		*) echo 'Bad arg - bye'; exit 42;;
	esac
done

victims=$(sudo docker ps -q)
for victim in $victims; do
	$app sudo docker stop $victim
done
exit 0
