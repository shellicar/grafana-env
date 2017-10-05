#!/bin/sh

TAGNAME=shellicar/grafana-plugin

docker build . \
    -t ${TAGNAME} \
    -f Dockerfile.dev

