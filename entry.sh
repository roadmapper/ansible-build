#!/bin/bash

set -e
git clone https://github.com/ansible/ansible /root/
cd /root/ansible
git checkout $tag
git submodule update --init --recursive
make