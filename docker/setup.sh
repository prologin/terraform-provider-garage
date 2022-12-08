#!/bin/sh

docker-compose -p garage up -d
sleep 2
docker-compose -p garage exec -it garage /garage layout assign ee804f5da6f5cf17 -z th2.hxg -c 1
docker-compose -p garage exec -it garage /garage layout apply --version 1
