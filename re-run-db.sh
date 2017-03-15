#!/bin/bash

docker network create orcl-net

docker kill xe-2.2
docker rm xe-2.2
docker run -p 1521:1521 --net orcl-net --detach --name=xe-2.2 xe-2
