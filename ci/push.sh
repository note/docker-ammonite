#!/bin/bash

# Exit on any failure
set -e

echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

docker build --build-arg SCALA_VERSION=2.12 --build-arg AMMONITE_VERSION=$TRAVIS_TAG . -t ammonite:2.12-$TRAVIS_TAG

docker build --build-arg SCALA_VERSION=2.13 --build-arg AMMONITE_VERSION=$TRAVIS_TAG . -t ammonite:2.13-$TRAVIS_TAG -t ammonite:latest

docker push note/ammonite
