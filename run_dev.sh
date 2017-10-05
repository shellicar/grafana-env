#!/bin/sh

. ./paths
del_stopped() {
    local name=$1
    local state
    state=$(docker inspect --format "{{.State.Running}}" "$name" 2>/dev/null)

    if [ "$state" = "false" ]; then
        docker rm "$name"
    fi
}

NAME=grafana-plugin
TAGNAME=shellicar/grafana-plugin

del_stopped ${NAME}
docker run \
    --rm \
    -it \
    --name "${NAME}" \
    -v ${PLUGIN_PATH}:/root/plugin/ \
    -v grafana-plugin-node-modules:/root/plugin/node_modules/ \
    -v /etc/localtime:/etc/localtime:ro \
    ${TAGNAME} \
    /bin/bash

