#!/bin/bash

set -ex

BUILDPARAMS=$@

docker build --tag tor-socks-proxy:single $BUILDPARAMS ./
docker build --tag tor-socks-proxy:multiple --build-arg BASEIMAGE=tor-socks-proxy:single $BUILDPARAMS --file multiple.Dockerfile ./
docker images | grep tor-socks-proxy
