#!/bin/bash
set -e

if [ $# -lt 3 ]; then
	echo "Usage : $0 v2.2.2.0-1 <centos|amzn>"
fi

TAG=$1

docker build -t ansible-build -f Dockerfile-$2 .

sudo rm -rf output/*
mkdir -p output
docker run -it --rm -v $PWD/output:/root/ansible/output ansible-build --build-arg tag=$TAG
sudo chown -R $USER $PWD/output

echo
echo "-------------"
echo
echo "RPM at ${PWD}/output"
