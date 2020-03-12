#!/bin/bash

# Exit on any failure
set -e

docker_build () {
	local SCALA_VERSION="$1"
	local FULL_TAG="$SCALA_VERSION-$TRAVIS_TAG"
	docker build --build-arg SCALA_VERSION=$SCALA_VERSION --build-arg AMMONITE_VERSION=$TRAVIS_TAG . -t ammonite:$FULL_TAG
	docker tag ammonite:$FULL_TAG note/ammonite:$FULL_TAG
}

echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

docker_build "2.12"
docker_build "2.13"

docker tag ammonite:2.13-$TRAVIS_TAG note/ammonite:latest

docker push note/ammonite
