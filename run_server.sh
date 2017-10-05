#!/bin/sh

. ./paths

NAME=grafana
TAG_NAME=shellicar/grafana
GRAFANA_STORAGE=grafana-storage
EXTERNAL_PORT=8080

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
    -p ${EXTERNAL_PORT}:3000 \
    --name="$NAME" \
    -v ${PLUGIN_PATH}:/usr/lib/grafana/plugins/sensorcloud/:rw \
    -v grafana-plugins:/usr/lib/grafana/plugins/ \
    -v ${GRAFANA_STORAGE}:/var/lib/grafana/data/:rw \
    -v /etc/localtime:/etc/localtime:ro \
    ${TAG_NAME}

