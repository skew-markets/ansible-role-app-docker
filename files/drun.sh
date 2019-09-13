#!/bin/bash

here=$(pwd)

docker_acct=tim
doit=true
envfile=''
image=''
noisy=true
tag=''
volumes=''
while getopts AHSU:e:i:qst:v: arg; do
	case $arg in
		A) volumes="$volumes -v $HOME/.aws:/root/.aws";;
		H) volumes="$volumes -v $here:/here";;
		S) volumes="$volumes -v $HOME/.ssh:/home/$docker_acct/.ssh";;
		U) docker_acct=${OPTARG};;
		e) envfile="--env-file ${OPTARG}";;
		i) image=$OPTARG;;
		q) noisy=false;;
		s) doit=false; noisy=true;;
		t) tag=$OPTARG;;
		v) volumes="$volumes -v $OPTARG";;
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
    echo "sudo docker run -i -t --rm $envfile $volumes ${image}:${tag}"
    echo ''
fi
if $doit; then
          sudo docker run -i -t --rm $envfile $volumes ${image}:${tag}
fi
exit $?
