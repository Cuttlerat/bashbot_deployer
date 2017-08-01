#!/bin/bash
BUILD="bashbot"
REPO="Cuttlerat/bashbot"
cd /builder/bashbot
while sleep 10; do
    git remote update &>/dev/null
    if [[ "$( git rev-parse @ )" != "$( git rev-parse origin/master )" ]]; then
        git pull
        docker build -t "${REPO}" .
        docker push "${REPO}"
        cd ../
        docker-compose build "${BUILD}"
        docker-compose create "${BUILD}"
        docker-compose restart "${BUILD}"
        cd -
    fi
done

