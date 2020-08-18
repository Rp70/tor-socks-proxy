#!/bin/bash

set -ex

docker build --tag tor-socks-proxy:single ./
docker build --tag tor-socks-proxy:multiple  --file multiple.Dockerfile ./
docker images | grep tor-socks-proxy
