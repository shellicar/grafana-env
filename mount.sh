#!/bin/sh

SHARE=vm_shared
TARGET="${HOME}/host"

sudo mkdir -p ${TARGET}
sudo mount -t vboxsf -o uid=$(id -u),gid=$(id -g) ${SHARE} ${TARGET}

