#!/usr/bin/env bash

cd "$(dirname $0)"

docker run debian:10 bash -c "apt-get update && apt-cache madison php7.3-fpm"
