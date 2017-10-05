#!/bin/sh

. ./paths

NAME=plugin-share

del_stopped() {
    local name=$1
    local state
    state=$(docker inspect --format "{{.State.Running}}" "$name" 2>/dev/null)

    if [ "$state" = "false" ]; then
        docker rm "$name"
    fi
}

docker stop ${NAME}
del_stopped ${NAME}

docker run \
    -it \
    --name "${NAME}" \
    -v ${PLUGIN_PATH}:/plugin \
    -p 139:139 \
    -p 445:445 \
    -d \
    dperson/samba \
    -u "hel071;pass1" \
    -s "plugin;/plugin;no;no;no;hel071;hel071"



