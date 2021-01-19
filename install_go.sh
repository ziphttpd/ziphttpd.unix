#!/bin/bash
set -e
ARCH="go1.15.6.linux-amd64"
if [ "$1" ]; then
	ARCH=$1
fi
gourl="https://golang.org/dl"
gotar="${ARCH}.tar.gz"
wget ${gourl}/${gotar} -O /tmp/${gotar}
sudo tar -C /usr/local -xzf /tmp/${gotar}
export PATH=$PATH:/usr/local/go/bin
