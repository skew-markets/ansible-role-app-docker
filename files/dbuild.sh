#!/bin/bash

if [[ ! -r Dockerfile ]]; then
	echo "No Dockerfile"
	exit  8
fi

doit=true
image=''
noisy=true
tag=''
while getopts i:qst: arg; do
	case $arg in
		i) image=$OPTARG;;
		s) doit=false;;
		q) noisy=false;;
		t) tag=$OPTARG;;
		*) echo 'bad arg - bye'; exit 42;;
	esac
done

if [[ -z "$image" ]]; then
	if [[ -r image ]]; then
		image=$(cat image)
	else
		image=$(basename $(pwd))
	fi
fi

if [[ -z "$tag" ]]; then
	if [[ -r tag ]]; then
		tag=$(cat tag)
	else
		tag='latest'
	fi
fi

# --------------------------------

if $noisy; then
	echo ''
	echo "sudo docker build -t ${image}:${tag} ."
	echo ''
fi

if $doit; then
          sudo docker build -t ${image}:${tag} .
fi
exit $?
