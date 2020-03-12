#!/bin/bash

# Exit on any failure
set -e

docker_build () {
	local SCALA_VERSION="$1"
	docker build --build-arg SCALA_VERSION=$SCALA_VERSION --build-arg AMMONITE_VERSION=$TRAVIS_TAG . -t ammonite:$SCALA_VERSION-$TRAVIS_TAG	
}

echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

docker_build "2.12"
docker_build "2.13"

docker tag ammonite:2.12 note/ammonite:2.12

docker tag ammonite:2.13 note/ammonite:2.13
docker tag ammonite:2.13 note/ammonite:latest

docker push note/ammonite
