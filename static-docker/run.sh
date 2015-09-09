#!/bin/bash

docker build --rm -t smcquaid:SICent7 .

CID=$(docker run -d -P wordpress:centos7)

echo "$(docker logs $CID )"

docker ps

# open http://localhost:port