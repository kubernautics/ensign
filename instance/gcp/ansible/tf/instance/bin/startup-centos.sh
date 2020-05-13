#!/bin/bash -x

pkgListPip3="\
	ansible \
	"

pkgListDnf="\
	curl \
	python3 \
	python3-pip \
	"

sudo dnf update -y
sudo dnf install -y ${pkgListDnf}
sudo pip3 install --global ${pkgListPip3}
echo $(date '+%Y%m%d%H%M%S') | sudo tee /root/user-data
