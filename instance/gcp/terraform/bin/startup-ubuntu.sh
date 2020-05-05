#!/bin/bash
pkgList="\
	curl \
	python3 \
	ansible \
	"

sudo apt-get -qy update
sudo apt-get -qy install ${pkgList}

curl -L https://github.com/usrbinkat.keys | tee -a ~/.ssh/authorized_keys
