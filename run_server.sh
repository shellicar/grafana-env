#!/bin/sh

. ./paths

NAME=grafana
TAG_NAME=shellicar/grafana
GRAFANA_STORAGE=grafana-storage

STATE=$(docker inspect --format '{{ .State.Running }}' ${NAME})
echo "State=$STATE"

if [ "$STATE" = "true" ]; then
    echo "Stopping & Removing"
    docker stop "$NAME" || exit
    docker rm "$NAME" || exit   
elif [ "$STATE" = "false" ]; then
    echo "Removing"
    docker rm "$NAME" || exit
fi
echo "Starting"

docker run \
    -d \
    -p 3000:3000 \
    --name="$NAME" \
    -v ${PLUGIN_PATH}:/var/lib/grafana/plugins/sensorcloud/:rw \
    -v ${GRAFANA_STORAGE}:/var/lib/grafana/:rw \
    -v /etc/localtime:/etc/localtime:ro \
    ${TAG_NAME}

