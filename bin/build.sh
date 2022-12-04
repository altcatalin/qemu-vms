#!/usr/bin/env bash
set -x

ARCH=`uname -m`
BOX_PROVIDER="parallels"

if [ "$ARCH" == "arm64" ]; then
    BOX="bento/ubuntu-20.04-arm64"
    BOX_VERSION="202112.19.0"
    QCOW2_FILENAME="bento-ubuntu-20.04-arm64.qcow2"
else
    BOX="bento/ubuntu-20.04"
    BOX_VERSION="202107.08.0"
    QCOW2_FILENAME="bento-ubuntu-20.04-amd64.qcow2"
fi

vagrant box add --provider $BOX_PROVIDER --box-version $BOX_VERSION $BOX
HDS_PATH=`find ~/.vagrant.d/boxes/$(echo ${BOX//\//-VAGRANTSLASH-})/$BOX_VERSION/$BOX_PROVIDER -name '*.hds'`
qemu-img convert -c -f parallels -O qcow2 "$HDS_PATH" "./boxes/$QCOW2_FILENAME"
