#!/bin/sh

TAGNAME=shellicar/grafana

docker build . \
    -t ${TAGNAME} \
    -f Dockerfile.server

