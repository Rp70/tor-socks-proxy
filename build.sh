#!/bin/bash

set -ex

docker build --tag tor-socks-proxy:single ./Dockerfile
docker build --tag tor-socks-proxy:multiple ./multiple.Dockerfile
docker images | grep tor-socks-proxy
