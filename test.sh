#!/bin/sh
FLOW_FILE=$1
FULL_PATH=$(realpath $0)
ROOT_PATH=$(dirname $FULL_PATH)
docker run -it --rm \
    -v $ROOT_PATH/test/recipes/$FLOW_FILE:/opt/$FLOW_FILE \
    -e FLOW_STORAGE_CONNECTION_STRING \
    -e FLOW_STORAGE_CONTAINER \
    -e FLOW_CACHE_CONTAINER \
    -e BAKERY_IMAGE \
    -e PREFECT__CLOUD__AGENT__LABELS \
    -e PREFECT_PROJECT \
    -e PREFECT__CLOUD__AUTH_TOKEN \
    $BAKERY_IMAGE python3 /opt/$FLOW_FILE