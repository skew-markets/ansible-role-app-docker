#!/bin/bash
# Removes Docker containers
#
# Defaults
# 	just removes containers that have exited
#   echos the 'docker rm' command line that it would have run
# Options
# 	-a means all containers
#   -x runs the 'docker rm' command
# --------------------------------

args="--filter status=exited"
app='echo'
while getopts ax arg; do
	case $arg in
		a) args="-a";;
		x) app='';;
		*) echo 'Bad arg - bye'; exit 42;;
	esac
done

victims=$(sudo docker ps -q $args)
for victim in $victims; do
	$app sudo docker rm $victim
done

# --------------------------------
exit 0
